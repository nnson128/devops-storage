* Lý thuyết
```
xác đinh được version trước đó
    mã hash commit trước cái mã commit mới (git lock) -> đóng gói nó lại
    dễ hơn: thư mục
```
1. backup trước khi upcode 
```

<!-- lab server -->
    mkdir /datas/shoeshop/backups
    mkdir /datas/shoeshop/run

pipeline configure:
    add param (active choice reactive params)
    name: rollback_version
```
2. groovy script
```
import jenkins.model.*
import hudson.FilePath
backupPath = "/datas/shoeshop/backups/"
def server = Jenkins.getInstance().getNode(server)
def remoteDir = new FilePath(server.getChannel(), "${backupPath}")

def files = remoteDir.list()
def nameFile = files.collect {it.name}

if(params.action == "rollback"){
    return nameFile
}

```
