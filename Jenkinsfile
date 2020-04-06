pipeline {
  environment {
    registry = "mkamel89/udacity-capstone"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    // stage('Cloning Git') {
    //   steps {
    //     git 'https://github.com/gustavoapolinario/microservices-node-example-todo-frontend.git'
    //   }
    // }
    stage("Linting HTML") {
      steps {
        sh "ls"
        echo 'Linting HTML'
        sh 'tidy *.html'
      }
    }

    stage("Linting Docker") {
      steps{
        echo 'Linting Docker File'
        sh 'hadolint --ignore DL3008 --ignore DL3015 Dockerfile'
      }
    }

    stage('Build Nginx Docker image') {
      steps{
        script {
          dockerImage = docker.build("registry:{$env.BUILD_ID}")
          // dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
        // }
      }
    }

    stage('Publish Image on DockerHub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }

    // stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
  }
}