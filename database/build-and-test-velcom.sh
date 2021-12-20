#!/bin/bash

contaienr_name="velcom-database"

db_username="velcom"
db_userpass="velcom_alksdjflkakjei"
db_rootpass="velcom_rootlkdjalienfklae"

db_name="velcom"
table_msg_name="velcom_msg"

# docker build -t velcom .
docker container stop ${contaienr_name}
docker container rm ${contaienr_name}
sleep 1

# docker run --name ${contaienr_name} -d -p 18080:80 velcom
docker run \
    --detach \
    --name ${contaienr_name} \
    --env MARIADB_USER=${db_username} \
    --env MARIADB_PASSWORD=${db_userpass} \
    --env MARIADB_ROOT_PASSWORD=${db_rootpass} \
    -p 3306:3306 \
    mariadb:latest

# docker exec -ti ${contaienr_name} /bin/bash

# install mysql cli_client
sudo apt install -y mysql-client

# wait for mysql service start
sleep 10


# connect to mysql and do some initial setup
mysql -u root -h "127.0.0.1" -P 3306 -p${db_rootpass} -e "
CREATE DATABASE ${db_name};
 USE ${db_name};
 CREATE TABLE IF NOT EXISTS ${table_msg_name}(
    msg_id INT UNSIGNED AUTO_INCREMENT,
    msg VARCHAR(100) NOT NULL,
    PRIMARY KEY (msg_id)
 )ENGINE=InnoDB DEFAULT CHARSET=utf8;
 INSERT INTO ${table_msg_name} (msg) VALUES ('请开始你的表演');
 GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_username}'@'%' IDENTIFIED BY '${db_userpass}';
 SHOW DATABASES;
 SELECT * FROM ${table_msg_name};
"