network:
  version: 2
  renderer: networkd
  ethernets:
    ens160:
      dhcp4: no
      addresses:
        - 192.168.227.130/24
      routes:
        - to: default
          via: 192.168.227.2
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]