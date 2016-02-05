#!/bin/bash

# this script

#######################################
# user defined variables
#######################################
OUTPUT_DIRECTORY="docker-registry-virtualbox"
PACKER_JSON="docker-registry.json"
DOMAIN="n24.de"
USERNAME="weltn24"
PASSWORD="weltn24"
VM_NAME="weltn24-docker-registry"
HOSTNAME="weltn24-docker-registry"
HTTP_DIR=./http
PRESEED_FILE=$HTTP_DIR/preseed.cfg
PRESEED_TEMPLATE=$HTTP_DIR/preseed.cfg.template
START_VIRTUALBOX_LOCALLY=true

# Static IP for VirtualBox host-only networking on eth1 (eth0 is dhcp, NAT)
IP_ADDRESS=192.168.56.101


#######################################
# build script
#######################################
PACKER_LOG=YES

# setup provisioning script creates eth1 for host-only or bridged networking in VirtualBox
NETWORK="${IP_ADDRESS%.*}.0"
BROADCAST="${IP_ADDRESS%.*}.255"
sed -e "s/__IP_ADDRESS__/$IP_ADDRESS/" -e "s/__NETWORK__/$NETWORK/" -e "s/__BROADCAST__/$BROADCAST/" -e "s/__USERNAME__/$USERNAME/" scripts/setup.sh.template >scripts/setup.sh

hash VBoxManage
[[ $? -eq 0 ]] && HAS_VBOX=true

if [[ "$HAS_VBOX" = true ]] && [[ "$START_VIRTUALBOX_LOCALLY" = true ]] ;then
    echo "VirtualBox is installed locally. The generated OVF will be imported after creation"
    VBOXINSTALLED=true
else
    echo "looks like you dont have VirtualBox installed locally. The generated OVF will not be imported"
    VBOXINSTALLED=false
fi

if [[ "$HAS_VBOX" = true ]] && [[ "$START_VIRTUALBOX_LOCALLY" = true ]] ;then
 echo "stopping/removing any registered/running VirtualBox vm named: $VM_NAME"
 VBoxManage list runningvms |grep $VM_NAME && VBoxManage controlvm "$VM_NAME" poweroff
 VBoxManage list vms |grep $VM_NAME && VBoxManage unregistervm "$VM_NAME" --delete
fi

TIMESTAMP=$(date +%F-%s)
# move any existing preseed file out of the way
[[ -f "$PRESEED_FILE" ]] && rm $PRESEED_FILE

# generate preseed file, replace variables with env variables
eval "$(cat $PRESEED_TEMPLATE| sed 's/"/+++/g'|sed 's/^\(.*\)$/echo "\1"/')" |sed 's/+++/"/g'|sed 's;\\";";g' > $PRESEED_FILE

#rm packer_virtualbox_virtualbox.box || true

# validate the packer json file
packer validate $PACKER_JSON

if [[ $? -ne 0 ]] ; then
    echo "validation of packer file $PACKER_JSON failed" >&2
    exit 1
fi

# perform a packer build
packer build \
    -var "output_directory=$OUTPUT_DIRECTORY" \
    -var "hostname=$HOSTNAME" \
    -var "vm_name=$VM_NAME" \
    -var "ssh_name=$USERNAME" \
    -var "ssh_pass=$PASSWORD" \
    -force \
    $PACKER_JSON


# import virtualbox image
if [[ $VBOXINSTALLED = true ]] ; then
 OVF_FILE=$(ls $OUTPUT_DIRECTORY/*.ovf)
 if [[ ! -f "$OVF_FILE" ]] ; then
     echo "could not find OVF file in $OUTPUT_DIRECTORY" >&2
     exit 1
 fi
 VBoxManage list vms |grep $VM_NAME && VBoxManage unregistervm "$VM_NAME" --delete
 VBoxManage import $OVF_FILE
 VBoxManage startvm "$VM_NAME" --type headless
fi
#vagrant box remove vagrant_machine || true
#vagrant box add vagrant_machine packer/packer_virtualbox_virtualbox.box

