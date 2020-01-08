pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '30'))
    }
    parametxxx {
    choice(
        name: 'AMI_TYPE',
        choices: "ECS\nCentOS7\nRHEL7",
        description: 'Select the base image' )
    }

    stages {
        stage('Execute AWS CodeBuild Project') {
            steps {
                sh "aws codebuild start-build --region us-east-1 --project-name base-ami --environment-variables-override name=AMI_TYPE,value=${params.AMI_TYPE}"
            }
        }
    }
    post {
        always {
            cleanWs()
            deleteDir()
        }
    }
}

