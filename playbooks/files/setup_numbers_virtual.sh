virt-install -n numbers -r 1024 --vcpus=1 -v -w bridge:br0  --disk path=/opt/virtuals/guests/numbers.img,size=10 --location /opt/iso/CentOS-6-minimal.iso --nographics --extra-args="ks=http://192.168.1.200/ks/numbers_ks.cfg ip=192.168.1.78 netmask=255.255.255.0 console=tty0 console=ttyS0,115200n8" 
