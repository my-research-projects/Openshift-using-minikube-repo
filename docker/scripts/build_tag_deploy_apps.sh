#!/usr/bin/env bash

sleep 1

echo "Building Docker image..."
echo "Tagging the images..."
echo "Pushing to repo..."
echo "Creating Deployment, & Exposing service...."
echo "for..."
echo "Easticsearch app..."
echo
	cd ../elastic
	./build_tag_deploy_elastic.sh
echo
echo "Done."
echo
sleep 2
echo

echo "Building Docker image..."
echo "Tagging the images..."
echo "Pushing to repo..."
echo "Creating Deployment, & Exposing service...."
echo "for..."
echo "Kibana app..."
echo
	cd ../kibana
	./build_tag_deploy_kibana.sh 
echo
echo "Done."
echo
sleep 2
echo

echo "Building Docker image..."
echo "Tagging the images..."
echo "Pushing to repo..."
echo "Creating Deployment, & Exposing service...."
echo "for..."
echo "Tomcat/Spring MVC Web app..."
echo
	cd ../tomcat
	./build_tag_deploy_tomcat.sh
echo
echo "Done."
