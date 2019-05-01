pipeline {
  agent {
    kubernetes {
      label 'tien-date-display-app'
      defaultContainer 'jnlp'
      yamlFile 'pipeline-pod.yml'
    }
  }
  stages {
    stage('Run build') {
      steps {
        container('docker-build') {
          sh 'docker info'
        }
      }
    }
  }
}
