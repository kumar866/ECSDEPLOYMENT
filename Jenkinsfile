pipeline {
    agent any
    tools{
        maven 'Maven'
    }

    stages {
        stage('git clone') {
            steps {
               git branch: 'main', url: 'https://github.com/kumar866/ECSDEPLOYMENT.git' 
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('jacaco'){
            steps{
             jacoco buildOverBuild: true, deltaBranchCoverage: '85', deltaClassCoverage: '85', deltaComplexityCoverage: '85', deltaInstructionCoverage: '85', deltaLineCoverage: '8', deltaMethodCoverage: '85', maximumBranchCoverage: '85', maximumClassCoverage: '85', maximumComplexityCoverage: '85', maximumInstructionCoverage: '85', maximumLineCoverage: '85', maximumMethodCoverage: '8', runAlways: true   
            }
        }
        stage('DOCKER BULID IMAGES'){
            steps{
               sh " docker build -t kumarramya/mywebrr ." 
            }
        }
        stage('Publish image to Docker Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'Docker_Hub_Pwd', variable: 'Docker_Hub_Pwd')]) {
                sh "docker login -u kumarramya -p ${Docker_Hub_Pwd}"
             } 
                sh "docker push kumarramya/mywebrr"
                }
            }
        }
        stage("Run Docker container on Jenkins Agent"){
            steps{
                 sh "docker run -d -p 8083:8080 kumarramya/mywebrr  "
            }
        }
        
    }
}
