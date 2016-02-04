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
	


####Installing

Clone the git repo.




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
