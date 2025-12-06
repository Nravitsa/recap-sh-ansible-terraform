pwd=$(pwd)


system_microservice_start () {
  cp "${pwd}/${app_name}.service" "/etc/systemd/system/${app_name}.service"
  systemctl daemon-reload
  systemctl enable ${app_name}
  systemctl start ${app_name}
}


download_and_install_app_content () {
  id roboshop || useradd roboshop
  rm -rf /appa
  curl -L -o "/tmp/${app_name}.zip" "https://roboshop-artifacts.s3.amazonaws.com/${app_name}-v3.zip"
  unzip "/tmp/${app_name}.zip"
}



install_nodejs () {
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y

  download_and_install_app_content

  npm install

}