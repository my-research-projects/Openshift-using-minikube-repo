#!/usr/bin/env bash
echo

minishift stop

echo

minishift start --memory=12000 --vm-driver=xhyve --v=999 --logtostderr --show-libmachine-logs --cpus=4

echo

docker run -d -p 5000:5000 --restart=always --name registry registry:2

echo 

minishift oc-env 

echo 

eval $(minishift oc-env)

echo 

sudo oc adm registry 

echo 

minishift docker-env

echo 

eval $(minishift docker-env)

echo 

docker ps

echo 

docker login -u developer -p $(oc whoami -t) $(minishift openshift registry) 

echo 

docker ps