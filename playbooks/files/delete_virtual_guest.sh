#!/bin/sh

# Need to make this an option if only deleting one of several.
#pkill kvm

# Use virsh list --all to get the list of guests.
guest=$1

# Delete whatever is saved.
/bin/rm /var/lib/libvirt/qemu/save/${guest}.save

virsh destroy ${guest}
virsh undefine ${guest}
#virsh vol-delete --pool vg0 ${guest}.img
/bin/rm /opt/virtuals/guests/${guest}.img
