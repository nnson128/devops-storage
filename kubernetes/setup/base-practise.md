NOTE
```
Mỗi pod thuộc về 1 namespace

Đảm bảo pod chạy đúng cách: sủ dụng workload management. restart, scale, rollback, update
workload (Deployment, StatefulSet, DaemonSet, Job, CronJob...) 

pod: các nhân viên quầy bán bánh
deployment: Chiến lược cho quầy bán bánh

replicaset: số lượng pod (nhân viên)

```
NAMESPACE
cd ~/projects/project-name(car-serv)

```

apiVersion: v1
kind: Namespace
metadata:
  name: car-serv
```

POD: 
```
apiVersion: v1
kind: Pod
metadata:
  name: car-serv
  namespace: car-serv
spec:
  containers:
  - name: car-serv
    image: elroydevops/car-serv:latest
    ports:
    - containerPort: 80

```
```
kubectl get pod -n 
kubectl apply -f ns.yaml
kubectl delete -f pod.yaml

recommend: 1 pod 1 project

```