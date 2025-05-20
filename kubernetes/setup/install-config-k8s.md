1. Cập nhật và nâng cấp hệ thống
```
sudo apt update -y && sudo apt upgrade -y
```
2. Tạo user devops và chuyển sang user devops
```
adduser devops
su devops
cd 
```
3. Tắt swap
```
sudo swapoff -a
sudo sed -i '/swap.img/s/^/#/' /etc/fstab
```
4. Cấu hình module kernel
```
vi /etc/modules-load.d/containerd.conf
content: 
overlay
br_netfilter
```
4. Cấu hình module kernel
```
sudo modprobe overlay
sudo modprobe br_netfilter
```
5. Cấu hình hệ thống mạng
```
echo "net.bridge.bridge-nf-call-ip6tables = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
echo "net.bridge.bridge-nf-call-iptables = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
```
6. Áp dụng cấu hình sysctl
```
sudo sysctl --system
```
7. Cài đặt các gói cần thiết và thêm kho Docker
```
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
8. Cài đặt containerd
```
sudo apt update -y
sudo apt install -y containerd.io
```
9. Cấu hình containerd
```
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
```
10. Khởi động containerd
```
sudo systemctl restart containerd
sudo systemctl enable containerd
```
11. Thêm kho lưu trữ Kubernetes
```
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```
12. Cài đặt các gói Kubernetes
```
sudo apt update -y
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```
