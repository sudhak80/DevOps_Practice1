# source module will fetch the file content to this module/file.
source ./00.common.sh

print_head "Copy mongodb repo file"
cp ${config_file_location}/files/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>${LOG}
status_check

print_head "Install MongoDB"
yum install mongodb-org -y &>>${LOG}
status_check

print_head "Allowing mongodb to accept traffic from anywhere (incoming)"
sed -i 's/10.0.0.0/0.0.0.0/g' /etc/mongod.conf &>>${LOG}
status_check

print_head "Enable MongoDB"
systemctl enable mongod &>>${LOG}
status_check

print_head "Starting MongoDB service"
systemctl start mongod &>>${LOG}
status_check