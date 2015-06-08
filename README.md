Docker Registry
===============

####Exercise:

We want to have an own Docker Registry to be able to host our docker images installed in a virtual machine.

####Acceptance criteria:

- built registry image can be run locally on virtualbox
- an image for the registry is build with [packer.io](https://packer.io/)
- basis OS for the virtual machine should be an ubuntu 14.04 LTS
- short documentation how to install it

####Hints:
- you can also use the following iso_url: "http://releases.ubuntu.com/14.04/ubuntu-14.04.2-server-amd64.iso"
- the iso_checksum is 83aabd8dcf1e8f469f3c72fff2375195
- choose freely your favourite packer-provisioner (chef for example)
- you can use the preseed in the http directory if you want



