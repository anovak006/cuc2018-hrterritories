# Ovo je samo za CUC2018

## Stvorimo novu radnu okolinu

https://www.virtualbox.org/

https://www.osboxes.org/

## Pripremimo infrastrukturu

## Pripremimo virtualnu okolinu
```
# bin/create_lxd_swarm.sh create_lxc_docker_profile create_lxc_docker_image node_create_all setup_lxc_containers
```

Podignimo docker swarm cluster
```
# bin/create_lxd_swarm.sh swarm_create
```
