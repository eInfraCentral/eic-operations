# Docker swarm Instructions

## Create Swarm
If the network does not exist and the database.  
    1. `docker network create -d overlay --attachable eic-net`  
    2. `docker build . -t eic-postgres`
    
Then create the infrastructure docker services with the `swarm-infra.yml` file.  
i.e. `docker stack deploy -c swarm-infra.yml infra`  

In order to create the registry service use the `swarm-eic.yml` file.  
i.e. `docker stack deploy -c swarm-eic.yml eic`  

## Delete Swarm
The command to delete the swarm is `docker stack rm <name>`.

The command to delete the network is `docker network rm <network_name>`.

## Update Service
    1. Update Image `docker service update --image <image_name> <service_name>`
    2. Add environment variable `docker service update --env-add "<environment>" <service_name>`
    3. Add publish port `docker service update --publish-add "port:port" <service_name>`
You can also use the `rm` equivalent, e.g. `env-rm`.

## Usefull Commands
Inspect a service `docker service inspect <service_name>`