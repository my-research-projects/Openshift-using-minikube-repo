#!/usr/bin/env bash

sleep 1
docker build -t spring-tomcat-server:8.4 .

docker tag spring-tomcat-server:8.4 $(minishift openshift registry)/myproject/spring-tomcat-server:8.4
sleep 1

docker push $(minishift openshift registry)/myproject/spring-tomcat-server:8.4
sleep 1

oc new-app --image-stream=myproject/spring-tomcat-server:8.4 --name=spring-tomcat-server
sleep 1

oc expose service spring-tomcat-server
sleep 1

oc run spring-tomcat-server --image 172.30.1.1:5000/myproject/spring-tomcat-server

sleep 2


echo "Docker built, tagged, pushed to repo, created new app/deployed, started and exposed Tomcat web app."