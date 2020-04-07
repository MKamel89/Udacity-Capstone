pipeline {
  environment {
    registry = "mkamel89/udacity-capstone"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    
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
          dockerImage = docker.build registry+":$BUILD_NUMBER"
        }
      }
    }

    stage('Publish Image on DockerHub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('set current kubectl context') {
      steps{
        withAWS(region:'us-west-2', credentials:'aws-cred') {
          sh "kubectl config use-context arn:aws:eks:us-west-2:680025312548:cluster/captsone-cluster"
        }
      }
    }

    stage('Deploying Blue Container') {
      steps{
        withAWS(region:'us-west-2', credentials:'aws-cred') {
          sh "kubectl apply -f ./blue-controller.json"
        }
      }
    }

    stage('Deploying Green Container') {
      steps{
        withAWS(region:'us-west-2', credentials:'aws-cred') {
          sh "kubectl apply -f ./green-controller.json"
        }
      }
    }

    stage('Redirect to Blue') {
      steps{
        withAWS(region:'us-west-2', credentials:'aws-cred') {
          sh "kubectl apply -f ./blue-service.json"
        }
      }
    }

    stage('Confirmation needed') {
      steps{
        input '''
          Traffic is currently routed to Blue. 
          You can use "kubectl get services" command to get the URL

          Proceed with green redirection?
        '''
      }
    }

    stage('Redirect to Green') {
      steps{
        withAWS(region:'us-west-2', credentials:'aws-cred') {
          sh "kubectl apply -f ./green-service.json"
        }
      }
    }
    
  }
}