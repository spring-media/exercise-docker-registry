Docker Registry
===============

####Exercise:

We want to have an own Docker Registry to be able to host our docker images.

####Acceptance criteria:

- basis OS should be an ubuntu 14.04 LTS
- built registry image can be run locally on virtualbox
- an image for the registry is build with [packer.io](https://packer.io/) (choose freely your favourite provisioner)
	- you can use the preseed in the http directory if you want
	- you can also use the following iso_url: "http://releases.ubuntu.com/14.04.1/ubuntu-14.04.1-server-amd64.iso"
	- and the iso_checksum is ca2531b8cd79ea5b778ede3a524779b9
- short documentation how to install it
