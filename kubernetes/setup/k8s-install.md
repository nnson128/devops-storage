K8S INSTALLATION
```
every server: netplan - addhost - hostname
192.168.1.111 k8s-master-1
192.168.1.112 k8s-master-2
192.168.1.113 k8s-master-3

sudo apt update -y && sudo apt upgrade -y

adduser devops
usermod -aG sudo devops
su devops
cd

sudo swapoff -a
sudo sed -i '/swap.img/s/^/#/' /etc/fstab 

sudo vi /etc/modules-load.d/containerd.conf
overlay
br_netfilter

sudo modprobe overlay
sudo modprobe br_netfilter

echo "net.bridge.bridge-nf-call-ip6tables = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
echo "net.bridge.bridge-nf-call-iptables = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf

sudo sysctl --system

sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update -y
sudo apt install -y containerd.io

containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

sudo systemctl restart containerd
sudo systemctl enable containerd

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

sudo apt update -y
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```
RESET K8S - RUN ON 3 SERVERS
```
sudo kubeadm reset -f
sudo rm -rf /var/lib/etcd
sudo rm -rf /etc/kubernetes/manifests/*
```
TRIEN KHAI CLUSTER K8S
```
------------------------------1 CONTROLER PLANE (ĐIỀU HÀNH ) - 2 WORKER (SERVER TRIỂN KHAI DỰ ÁN)------------------------------
# k8s-master-1:
sudo kubeadm init
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# k8s-master-2
# k8s-master-3
Run command

- k8s-master-1:
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
WAITING FOR 5 MINUTES

------------------------------3 MASTER - 3 WORKER------------------------------------------------------------------------------
# k8s-master-1
sudo kubeadm init --control-plane-endpoint "192.168.1.111:6443" --upload-certs 
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# k8s-master-2 / k8s-master-3
kubeadm join 192.168.1.111:6443 --token 57xvrz.fmpg8cuyp0k2mbrz \
      --discovery-token-ca-cert-hash sha256:cfeaba52ba959af7ef89cec6db9a07a5a1c93dcb004250556e3841348dc01aec \
      --control-plane --certificate-key 9a49d865bd854dea545b9222b20d9719296853cf65846f9ce22b1378e30a4b42

# K8S-MASTER-1
kubectl taint nodes k8s-master-1 node-role.kubernetes.io/control-plane:NoSchedule- 
kubectl taint nodes k8s-master-2 node-role.kubernetes.io/control-plane:NoSchedule- 
kubectl taint nodes k8s-master-3 node-role.kubernetes.io/control-plane:NoSchedule- 

```
INSTALL RANCHER SERVER
```
- tạo 1 hard disk khác vào trong server và lưu dữ liệu vào ổ cứng này (backup and rollback)
- hard disk > add > hard disk > Recommend > 20gb > success

SSH
sudo mkfs.ext4 -m 0 /dev/sdb
mkdir /data
echo "/dev/sdb  /data  ext4  defaults  0  0" | sudo tee -a /etc/fstab
mount -a
sudo df -h

apt update
apt install docker.io
apt install docker-compose

version: '3'
services:
  rancher-server:
    image: rancher/rancher:v2.9.2
    container_name: rancher-server
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /data/rancher/data:/var/lib/rancher
    privileged: true

# docker compose up -d
# https://192.168.1.114/

```

```
SỬ DỤNG CÔNG CỤ GIAO DIỆN ĐỂ TRÍCH XUẤT FILE YAML
```
Command app - K9S
Desktop app - Lens
Website app - Rancher
```
```
ERROR PENDING
``` 
kubectl -n kube-system edit configmap coredns
hosts {
  192.168.1.114 rancher.nnson128.vn
  fallthrough
}
```

```
