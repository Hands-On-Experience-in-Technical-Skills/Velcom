#!/bin/bash

contaienr_name="velcom-nginx"

docker build -t velcom .
docker container stop ${contaienr_name}
docker container rm ${contaienr_name}
sleep 1
docker run --name ${contaienr_name} -d -p 18080:80 velcom

docker exec -ti ${contaienr_name} /bin/bash