#!/bin/bash

contaienr_name="velcom-midware"

docker build -t ${contaienr_name} .
docker container stop ${contaienr_name}
docker container rm ${contaienr_name}
sleep 1
docker run --name ${contaienr_name} -d -p 5000:5000 ${contaienr_name}

docker exec -ti ${contaienr_name} /bin/bash
