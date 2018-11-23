#!/bin/bash

MANAGER_COUNT=3
WORKER_COUNT=0

MANAGER_NAME=swarm-manager
WORKER_NAME=swarm-worker

MANAGER_LIST=""
for i in `seq 1 $MANAGER_COUNT`;
do
    MANAGER_LIST="$MANAGER_LIST $MANAGER_NAME-$i"
done

WORKER_LIST=""
for i in `seq 1 $WORKER_COUNT`;
do
    WORKER_LIST="$WORKER_LIST $WORKER_NAME-$i"
done

NODE_LIST="$MANAGER_LIST $WORKER_LIST"

function contains {
    for item in $2
    do
        if [ "$item" == "$1" ]; then
            echo true
            return
        fi
    done
    echo false
}

function is_worker {
    if $(contains $1 "$WORKER_LIST")
    then
        echo true
        return
    fi
    echo false
}

function is_manager {
    if $(contains $1 "$MANAGER_LIST")
    then
        echo true
        return
    fi
    echo false
}

function node_exec_all {
    for node in $NODE_LIST
    do
        lxc exec $node -- $*
    done
}


function node_cmd_all {
    for node in $NODE_LIST
    do
        $1 $node
    done
}

function node_cmd_all_async {
    PIDS=""
    for node in $NODE_LIST
    do
        $1 $node &
        PIDS="$PIDS $!"
    done

    for pid in $PIDS
    do
        wait $pid
    done
}

function node_lxc_launch {
    lxc launch $1 $2 -p default -p docker
}

function node_create {
    echo "Creating $1"
    node_lxc_launch docker $1
    # lxc config device add $1 docker disk source=/dev/zvol/lxd/swarm path=/var/lib/docker
}

function node_create_all {
    node_cmd_all node_create
}

function node_start {
    echo "Starting $1"
    lxc start $1
    # lxc config device add $1 docker disk source=/dev/zvol/lxd/swarm path=/var/lib/docker
}

function node_start_all {
    node_cmd_all node_start
}

function node_stop {
    echo "Stoping $1"
    lxc stop $1
}

function node_stop_all {
    node_cmd_all node_stop
}

function node_remove {
    echo "Removing $1"
    lxc delete --force $1
}

function node_remove_all {
    node_cmd_all node_remove
}

function get_ip {
    lxc exec $1 -- hostname -i|cut -f2 -d" "
}

function get_swarm_worker_token {
    lxc exec $MANAGER_NAME-1 -- docker swarm join-token -q worker
}

function get_swarm_manager_token {
    lxc exec $MANAGER_NAME-1 -- docker swarm join-token -q manager
}

function swarm_join {
    if [ "$1" == "$MANAGER_NAME-1" ]; then
        return
    fi

    ip=$(get_ip $MANAGER_NAME-1)

    if $(is_manager $1)
    then
        token=$(get_swarm_manager_token)
    fi

    if $(is_worker $1)
    then
        token=$(get_swarm_worker_token)
    fi

    echo "Join $1 with $token to $ip"

    echo "lxc exec $1 -- docker swarm join --token $token $ip:2377"
    sleep 1
    lxc exec $1 -- docker swarm join --token $token $ip:2377
    sleep 1
}

function swarm_join_all {
    node_cmd_all swarm_join
}

function swarm_create {
    lxc exec $MANAGER_NAME-1 -- docker swarm init
    swarm_join_all
}

function create_lxc_docker_profile {
    echo "Crate Docker profile"
    lxc profile create docker
    lxc profile set docker security.nesting true
    lxc profile set docker security.privileged true
    lxc profile set docker linux.kernel_modules ip_tables,ip6_tables,netlink_diag,nf_nat,br_netfilter,overlay
    lxc profile set docker raw.lxc lxc.aa_profile=unconfined
    lxc profile set docker raw.lxc lxc.apparmor.profile=unconfined
    # lxc profile set docker raw.lxc "lxc.mount.entry=lxd/swarm /var/lib/docker zfs defaults 0 0"
    lxc profile set docker linux.kernel_modules overlay,nf_nat,ip_tables,ip6_tables,netlink_diag,br_netfilter,xt_conntrack,nf_conntrack,ip_vs,vxlan
    lxc profile show docker
}

function create_lxc_docker_image {
    # https://askubuntu.com/questions/815993/how-to-add-br-netfilter-to-an-lxd-container
    node_lxc_launch ubuntu:18.04 docker

    sleep 30

    lxc exec docker -- apt update -qq
    lxc exec docker -- apt -y upgrade
    lxc exec docker -- apt install -y apt-transport-https ca-certificates curl software-properties-common
    lxc exec docker -- sh -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -"
    lxc exec docker -- sh -c 'add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"'
       # edge"
    lxc exec docker -- apt update -qq
    # lxc exec docker -- apt install -y containerd.io
    # Issue 475 - https://github.com/docker/for-linux/issues/475 - remove later
    lxc exec docker -- mkdir /etc/systemd/system/containerd.service.d
    lxc exec docker -- sh -c "cat <<EOT > /etc/systemd/system/containerd.service.d/override.conf
[Service]
ExecStartPre=
EOT"
    # lxc config device add my-container docker disk source=/dev/zvol/my-pool/docker/blah path=/var/lib/docker
    # lxc config set docker raw.lxc "lxc.mount.entry=lxd/swarm /var/lib/docker zfs defaults 0 0"
    # lxc config device add docker docker disk source=/dev/zvol/lxd/swarm path=/var/lib/docker
    lxc exec docker -- apt install -y docker-ce
    lxc exec docker -- ls /etc/docker
    lxc exec docker -- sh -c 'cat <<EOT > /etc/docker/daemon.json
{
  "storage-driver": "overlay2"

}
EOT'
    lxc exec docker -- ls /etc/docker
    lxc exec docker -- cat /etc/docker/daemon.json
    lxc stop docker
    lxc publish docker --alias docker
    lxc delete docker
}

function delete_lxc_docker_image {
    lxc image delete docker
}

function setup_lxc_containers {
    node_exec_all touch /.dockerenv
}

for var in "$@"
do
    echo "$var"
    # Check if the function exists (bash specific)
    if declare -f "$var" > /dev/null
    then
      # call arguments verbatim
      "$var"
    else
      # Show a helpful error
      echo "'$1' is not a known function name" >&2
      exit 1
    fi
done


# create_lxc_docker_profile && create_lxc_docker_image && node_create_all && setup_lxc_containers && swarm_create
