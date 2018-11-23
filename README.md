# Ovo je samo za CUC2018

## Stvorimo novu radnu okolinu

https://www.virtualbox.org/

https://www.osboxes.org/

## Repozitorij

```
> apt install git
> mkdir cuc2018
> cd cuc2018
> git clone https://github.com/anovak006/hrterritories.git
```

## Instalacija LXD-a

```
# snap install lxd
# lxd init
```
```
Would you like to use LXD clustering? (yes/no) [default=no]:
Do you want to configure a new storage pool? (yes/no) [default=yes]:
Name of the new storage pool [default=default]:
Name of the storage backend to use (btrfs, ceph, dir, lvm, zfs) [default=zfs]: btrfs
Create a new BTRFS pool? (yes/no) [default=yes]:
Would you like to use an existing block device? (yes/no) [default=no]:
Size in GB of the new loop device (1GB minimum) [default=42GB]: 8
Would you like to connect to a MAAS server? (yes/no) [default=no]:
Would you like to create a new local network bridge? (yes/no) [default=yes]:
What should the new bridge be called? [default=lxdbr0]:
What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]:
What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]:
Would you like LXD to be available over the network? (yes/no) [default=no]:
Would you like stale cached images to be updated automatically? (yes/no) [default=yes]
Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]:
```

## Pripremimo infrastrukturu

```
# bin/create_lxd_swarm.sh \
create_lxc_docker_profile \
create_lxc_docker_image \
node_create_all setup_lxc_containers
```

Podignimo docker swarm cluster
```
# bin/create_lxd_swarm.sh swarm_create
```

## Jedan Hello World primjer

```
>lxc exec swarm-manager-1 – bash
# docker service create --replicas 1 --name helloworld alpine ping docker.com
# docker service ls
# docker service inspect --pretty helloworld
# docker service ps helloworld
# docker service scale helloworld=5
# docker service rm helloworld
```

## Continous Integration - CI

```
# snap install docker

>docker pull postgresql:10-alpine
>docker image list

>docker-compose -f docker_compose_unittest_local.yml build unit
>docker-compose -f docker_compose_unittest_local.yml run --rm unit pytest tests
```

```
>docker-compose -f \ docker_compose_stagingtest_local.yml build db
>docker-compose -f \ docker_compose_stagingtest_local.yml run db
>docker-compose -f \ docker_compose_stagingtest_local.yml up -d staging
```
