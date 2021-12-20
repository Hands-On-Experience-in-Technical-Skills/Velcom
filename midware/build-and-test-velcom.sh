#!/bin/bash

contaienr_name="velcom-midware"

docker build -t ${contaienr_name} .
docker container stop ${contaienr_name}
docker container rm ${contaienr_name}
sleep 1
docker run --name ${contaienr_name} -d -p 5000:5000 ${contaienr_name}

sleep 5

# sudo apt-get update && sudo apt-get install -y curl netcat

# nc -zv 127.0.0.1 5000

curl -L http://127.0.01:5000/

# docker exec -ti ${contaienr_name} /bin/bash
