pipeline {
  agent any
  stages {
      stage('Linting') {
          steps {
          echo 'linting..'
          }
      }
      stage('Build Dev') {
        when { 
          branch 'dev'
          anyOf {
            changeset "Dockerfile"
            changeset "k8s/base/**"
            changeset "k8s/dev/**"
          }
        }
        steps {
            echo 'Build Dev..'
            sh("cd k8s/dev/ && skaffold run")
        }   
      }
      stage('Build Production') {
        when { 
          branch 'master'
          anyOf {
            changeset "Dockerfile"
            changeset "k8s/base/**"
            changeset "k8s/production/**"
          }
        }
        steps {
            echo 'Build Production....'
            sh("cd k3s/production/ && skaffold run")
          }  
        }
      stage('Build Docs') {
        when { changeset "docs/**" }
        steps {
            echo 'Build Docs...'
          }  
        }
      }
      post {
        success {
           echo "Build successfully..."
           slackSend color: "good", message: "Build successfully on $JOB_NAME..."
       }
       failure {
           echo "Build failed..."
           slackSend color: "danger", message: "Build failed on $JOB_NAME..."
       }
    }
}
