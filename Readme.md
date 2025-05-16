appUser = "shoeshop"
appName = "shoe-ShoppingCart"
appVersion = "0.0.1-SNAPSHOT"
appType = "jar"
processName = "${appName}-${appVersion}.${appType}"
folderDeploy = "/datas/${appUser}"
buildScript = "mvn clean install -DskipTests=true"
copyScript = "sudo cp target/${processName} ${folderDeploy}"
permsScript = "sudo chown -R ${appUser}. ${folderDeploy}"
killScript = "pgrep -f ${processName} && sudo pkill -f ${processName} || echo 'No process found, skipping kill step'"
runScript = "sudo su ${appUser} -c 'cd ${folderDeploy}; java -jar ${processName} > nohup.out 2>&1 &'"
// use app user to deploy project

def getProcessId(processName){
    def processId = sh(returnStdout:true, script: """pgrep -f ${processName}""", label: "Get process Id")
}

def startProcess(){
    stage("start"){
        sh(script: """${runScript}""", label: "Run with maven")
        // Nohup.out: Web server failed to start. Port 9999 was already in use.
        sleep 5
        def processId = getProcessId("${processName}")
        if(processId == ""){
            error("Error: Cannot start process<Process Id PID: ${processId} Not Found>")
        }
    }    
    echo "Started Application ${processName} On Server: ${params.server}"
}
def stopProcess(){
    stage("stop"){
        def processId = getProcessId("${processName}")
        if(processId != ""){
            sh(script: """${killScript}""", label: "")
        }
        echo "Stopped Application ${processName} On Server: ${params.server}"
    }
}

node(params.server){
    // params.server: lable of node to run pipeline script
    currentBuild.displayName = params.action
    // currentBuild.displayName: #1
    if(params.action == "start"){
        startProcess()
    } else if(params.action == "stop"){
        stopProcess()
    }
}

syntax:
checkout([
  $class: 'GitSCM',
  branches: [[name: '*/main']],
  userRemoteConfigs: [[
    url: 'https://github.com/your-repo/project.git',
    credentialsId: 'your-credentials-id'
  ]]
])
