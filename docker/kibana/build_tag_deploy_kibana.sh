#!/usr/bin/env bash

sleep 1
docker build -t kibana:5.4.0 .

sleep 1
docker tag kibana:5.4.0 $(minishift openshift registry)/myproject/kibana:5.4.0

sleep 1
docker push $(minishift openshift registry)/myproject/kibana:5.4.0

sleep 1
oc new-app --image-stream=myproject/kibana:5.4.0 --name=kibana

sleep 1
oc expose service kibana

sleep 1
oc run kibana --image 172.30.1.1:5000/myproject/kibana

sleep 2

echo "Docker built, tagged, pushed to repo, created new app/deployed, started and exposed Kibana."