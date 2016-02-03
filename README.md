Docker Registry
===============

####Exercise:

We want to have an own Docker Registry to be able to host our docker images. In order to experiment with the registry, we need to have it installed in a virtual machine.

####Acceptance criteria:

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
