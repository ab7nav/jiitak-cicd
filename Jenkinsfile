pipeline{
    agent{
        node{
            label 'AbhinavServer'
        }
    }
    stages{
        stage('Checkout SCM'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ab7nav/jiitak-cicd.git']])
            }
        }
        stage('build docker image'){
            steps{
                script {
                    def imageName = "WEBAPP:${env.BUILD_NUMBER}"
                    docker.image(imageName).build()
                }
            }
        }
        stage('runContainer'){
            steps{
                script {
                    // Check if a container with the same port is already running
                    def existingContainer = sh(script: "docker ps -q -f publish=0.0.0.0:5001", returnStdout: true).trim()
                    def imageName = "WEBAPP:${env.BUILD_NUMBER}"

                    if (existingContainer != "") {
                        sh "docker stop ${existingContainer}"
                        sh "docker rm ${existingContainer}"
                    }
                    docker.image(imageName).into('container').withRun {
                        portMappings([
                            docker.tcpPort(5001).containerPort(5000)
                        ])
                    }
                }    
            }
        }
    }
}
