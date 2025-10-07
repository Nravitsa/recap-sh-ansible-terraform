app_name=catalogue
source common.sh

install_nodejs






cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y

mongosh --host MONGODB-SERVER-IPADDRESS </app/db/master-data.js

system_microservice_start