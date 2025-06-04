```
K8S MATER COMMAND (cd /home/devops/projects)

kubectl get node -o wide
kubectl get namespace

kubectl get pod
kubectl get pod --namespace default

kubectl create namespace project-1

kubectl delete namespace project-1
kubectl apply -f namespace.yaml
kubectl delete -f namespace.yaml
```

???
```
# Kiểm tra các pod hệ thống
kubectl get pods -n kube-system

# Kiểm tra các pod Calico (CNI)
kubectl get pods -n calico-system
```