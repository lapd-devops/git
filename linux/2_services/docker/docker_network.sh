#create new network("bridge by default")
docker network create rbm-24-bridge
#list networks
docker network ls
#remove one network by name
docker network rm mynetwork
#remove all networks
docker network prune
#run container, attached to new network
docker run -d --name rbm-dkr-24-nginx --network rbm-24-bridge nginx:stable
#run alpine, install curl and curl other container by DNS(container name)
docker run -it --rm --name alp-dkr-24 --network rbm-24-bridge alpine:3.10 /bin/ash -c "apk add --update curl && curl -v container_name" 


#netstat, ping, ip in debian-based container
docker exec container_name /bin/bash -c "apt update && apt install net-tools iputils-ping iproute2 -y && netstat -ntulp && ping -c 4 db && ip a"
#netstat, ping in alpine-based container
docker exec container_name /bin/ash -c "apk update && apk add ospd-netstat iputils  && netstat -ntulp"
#telnet(nc) in alpine-based container
docker exec ontainer_name /bin/ash -c "nc db 3306"
