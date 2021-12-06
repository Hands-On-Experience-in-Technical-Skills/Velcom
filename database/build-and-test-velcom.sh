#!/bin/bash

contaienr_name="velcom-database"

db_username="velcom"
db_userpass="velcom_alksdjflkakjei"
db_rootpass="velcom_rootlkdjalienfklae"

# docker build -t velcom .
docker container stop ${contaienr_name}
docker container rm ${contaienr_name}
sleep 1

# docker run --name ${contaienr_name} -d -p 18080:80 velcom
docker run --detach --name ${contaienr_name} --env MARIADB_USER=${db_username} --env MARIADB_PASSWORD=${db_userpass} --env MARIADB_ROOT_PASSWORD=${db_rootpass} -p 3306:3306 mariadb:latest

docker exec -ti ${contaienr_name} /bin/bash