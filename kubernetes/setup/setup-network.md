1. config network
```
    clone three server
vi etc/hosts
    192.168.227.131 k8s-master-1
    192.168.227.132 k8s-master-2
    192.168.227.133 k8s-master-3
vi etc/hostname
    k8s-master-1
    k8s-master-2
    k8s-master-3
vi etc/netplan
    netplan apply
    ip a
    shutdown now
create snapshot k8s-master-1, k8s-master-2, k8s-master-3
```
