Docker Registry
===============

##### Submitter:

Jonathan Colby




####Methodology:

My approach to solve this exercise:

- Use [Packer](https://packer.io/) to create 2 vm types:
  - VirtualBox OVF file
  - Vagrant box
- The vms are created using the packer **virtualbox-iso** builder, based on the ubuntu-14.04.3-server-amd64 ISO
- Docker is installed on the vm ([docs.docker.com](https://docs.docker.com/engine/installation/ubuntulinux/)
- The "official" [Docker Registry project](https://github.com/docker/distribution/blob/master/docs/deploying.md) is used as the registry.
- Because of simplicity and speed of implementation, configuration/provisioning is done with Bash Shell scripts. Although I could rewrite them in Puppet if requested. 

####Project Structure

	.
	├── LICENSE
	├── README.md
	├── create-docker-registry-ovf.sh (main script)
	├── docker-registry.json  (packer json template)
	├── http
	│   ├── preseed.cfg.orig
	│   └── preseed.cfg.template (template for preseeding)
	├── output-virtualbox-iso/ (OVF output directory)
	├── scripts/ (provisioning shell scripts)
	│   ├── apt_install.sh
	│   ├── cleanup.sh
	│   ├── docker_install.sh
	│   ├── docker_registry_install.sh
	│   ├── docker_service.sh
	│   ├── setup.sh
	│   └── vagrant.sh
	└── vagrant (Vagrant BOX output directory)
    	├── Vagrantfile.template
	

####System Requirements

- Internet connectivity
- A recent packer version (developed with 0.8.6, install with Homebrew)
- VirtualBox
- (optional) Vagrant
- git
- terminal program

####Installing

1. Clone the git repo.

2. Locate and open the file `create-docker-registry-ovf.sh`. This file contains variables which you may want to change. For example, `START_VIRTUALBOX_LOCALLY`, `IP_ADDRESS`,`USERNAME`,`PASSWORD`

3. Run the script `create-docker-registry-ovf.sh`:
	
    ./create-docker-registry-ovf.sh
    
4. The build process will download the Ubuntu ISO the first time it runs.  This may take a while.  Also, the Docker Registry image will be downloaded from the internet (see methodology above)

5. If `START_VIRTUALBOX_LOCALLY` is set to `true`, then the created VirtualBox image will be started on your local VirtualBox.  **Note**, it is your responsiblility to setup VirtualBox networking.  The interface eth1 was created with a static IP address, to use for host-only networking, for example.

6. The generated images are saved to:  `output-virtualbox-iso` and `vagrant`
	


	






####Tech Notes:

- built registry image can be run locally on virtualbox
- an image for the registry is build with [packer.io](https://packer.io/)
- basis OS for the virtual machine should be an ubuntu 14.04 LTS
- short documentation how to install it

####Hints:
- you can also use the following iso_url: [ubuntu_14.04](http://releases.ubuntu.com/14.04/ubuntu-14.04.3-server-amd64.iso)
- choose freely your favourite packer-provisioner (chef for example)
- you can use the preseed in the http directory if you want
- commit frequently so we can see how you have approached the problem

####How to contribute your solution:

1. Fork the repo
2. Commit everything that you do in your fork
3. Create a pull request with your solution. Your pull request should include all source code which you used to create your solution.
