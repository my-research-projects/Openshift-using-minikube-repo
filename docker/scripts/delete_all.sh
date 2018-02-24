#!/usr/bin/env bash

oc delete imagestreams elasticsearch kibana spring-tomcat-server 
oc delete deploymentconfigs elasticsearch kibana spring-tomcat-server 
oc delete routes elasticsearch kibana spring-tomcat-server
oc delete po elasticsearch kibana spring-tomcat-server
oc delete rc elasticsearch kibana spring-tomcat-server
oc delete svc elasticsearch kibana spring-tomcat-server

echo
echo

docker ps

echo
echo

docker ps -a

echo
echo

docker images

echo
echo

oc get all

echo
echo