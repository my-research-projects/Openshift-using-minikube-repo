1.	Overview:
	The following section describes how to install Minishift and the required dependencies.
2.	Prerequisites:
	Minishift requires a hypervisor to start the virtual machine on 	which the OpenShift cluster is provisioned. Verify that the 	hypervisor of your choice is installed and enabled on your system 	before you start Minishift.
3.	xhyve, a lightweight OS X virtualization solution:
	brew update
	brew update brew install --HEAD xhyve
4.	Download VirtualBox:
	https://www.virtualbox.org/wiki/Downloads
5. 	Minishift:
	5.1 Install Minishift
		brew cask install minishift
	5.2 Update Minishift
		brew cask install --force minishift
	5.3 oc version
6.	Starting Minishift (Start minishift with options as below)
	minishift start --memory=12000 --vm-driver=xhyve --v=999 --logtostderr --show-	libmachine-logs --cpus=4 
	-	Note: By default, Minishift uses the driver most relevant to 	the host OS. To use a different driver, set the --vm-driver flag in 	minishift start. For example, to use VirtualBox instead of KVM on 	Linux operating systems, run minishift start --vm- 	driver=virtualbox
	6.1	You will start seeing the following messages
		-- Starting profile Ôminishift'
		-- Checking if requested hypervisor 'xhyve' is supported on 		   this platform É OK
		-- Checking if xhyve driver is installed ...
		Driver is available at /usr/local/bin/docker-machine-driver-		xhyve
		Checking for setuid bit É OK
		-- Checking the ISO URL É OK
		-- Starting local OpenShift cluster using 'xhyve' hypervisor 
		-- Minishift VM will be configured with É
		    Memory:    2 GB
		    vCPUs :    2
		    Disk size: 20 GB 
		Downloading ISO 'https://github.com/minishift/minishift-b2d-		iso/releases/download/v1.2.0/minishift-b2d.iso' 40.00 MiB / 4		0.00 MiB 				
		[==============] 100.00% 0s -- Starting Minishift VM ÉÉÉÉÉ..
		-- Exporting of OpenShift images is occuring in background 		process with pid 4351.
 	6.2 OpenShift server started. 
		The server is accessible via web console at: 
		https://192.168.64.6:8443 
		You are logged in as: User: developer / Password: <any value>  		(developer/developer)
		To login as administrator: oc login -u system:admin 			admin/admin)
	6.3	The IP is dynamically generated for each OpenShift cluster. 		To check the IP, run the minishift ip command.
	6.4	Use minishift oc-env to display the command you need to type 		into your shell in order to add the oc binary to your PATH 		environment variable.
	6.5	$ minishift oc-env 
		export PATH="/Users/<user>/.minishift/cache/oc/v3.7.1/ 			darwin:$PATHÓ 
		- Run this command to configure your shell:
		- eval $(minishift oc-env)
7.	eval $(minishift oc-env)
8.	To deploy the integrated Docker registry:
	$ sudo oc adm registry 
9.	$ minishift docker-env 
	export DOCKER_TLS_VERIFY="1Ó 
	export DOCKER_HOST="tcp://192.168.64.6:2376Ó 
	export DOCKER_CERT_PATH="/Users/<user>/.minishift/certsÓ 
	-Run this command to configure your shell: 
	- eval $(minishift docker-env) 
10.	$ eval $(minishift docker-env) 
11.	docker login -u developer -p $(oc whoami -t) $(minishift openshift registry) 
Ensure that the Docker daemon is running with the following argument:
    	--insecure-registry 172.30.0.0/16
12.	$ docker ps

Troubleshooting:
1. Containers are getting evicted because ÒThe node was low on resource: imagefs.Ó, make sure that the minishit is started with the right options, the command should look like this:
minishift start --memory=12000 --vm-driver=xhyve --v=999 --logtostderr --show-libmachine-logs --cpus=4
2. Registry fails with connection refused:
make sure do delete all the docker processes, images (docker ps, docker ps -a, docker images) and try to push the images again. Make sure to be in minishift oc-env before building and pushing the images.
3. ERROR: bootstrap checks failed: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
From command/terminal prompt execute the following:
- minishift ssh
- sudo sysctl -w vm.max_map_count=262144
- exit
4. WARNING! Using --password via the CLI is insecure. Use --password-stdin. Error response from daemon: Get http://172.30.1.1:5000/v2/: unauthorized: authentication required
To fix this issue, run: oc login -u system:admin (admin/admin) and execute the shell script again: "sh install_minishift_openshift.sh". If that doesn't help, execute each command manully from "install_minishift_openshift.sh"
 

Usage: (Note: I built and deployed to Openshift on macOS 10.13.1 (17B1003)

1. Clone the repo or download as zip file.
2. Extract the zip file (if downloaded as .zip)
3. Open command line editor/terminal and go into "scripts" folder under "docker" (where you saved or cloned the repo).
4. Run This shell script to prepare the environment for the first time "sh install_minishift_openshift.sh"
5. Run this shell script "sh build_tag_deploy_apps.sh" to do the following:
- Build Docker images
- Tag the images
- Push to docker registry
- Set image stream
- Expose and
- Run the service.
6. To build, tag, docker images to deploy to Openshift, execute "sh build_tag_deploy_apps.sh" from terminal.
7. Optional: run this shell script: "sh delete_all.sh" to cleanup the following:
- Imagestreams
- Deployment Configuration
- Routes
- Pods
- Replication Controllers & Services.
