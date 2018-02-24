#!/usr/bin/env bash

sleep 1
docker build -t elasticsearch:5.4.0 .

sleep 1
docker tag elasticsearch:5.4.0 $(minishift openshift registry)/myproject/elasticsearch:5.4.0

sleep 1
docker push $(minishift openshift registry)/myproject/elasticsearch:5.4.0

sleep 1
oc new-app --image-stream=myproject/elasticsearch:5.4.0 --name=elasticsearch

sleep 1
oc expose service elasticsearch

sleep 2

echo "Docker built, tagged, pushed to repo, created new app/deployed, started and exposed Elasticsearch app"
