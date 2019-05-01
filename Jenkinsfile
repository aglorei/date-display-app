label = "tien-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
    containerTemplate(name: 'docker-build', image: 'docker:latest', ttyEnabled: true, command: 'cat'),
  ]) {
    node(label) {
        stage('Build') {
            container('docker-build') {
                withCredentials ([[
                    $class: 'UsernamePasswordMultiBinding',
                    credentialsId: 'tien-dockerhub',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD',
                ]]) {
                    stage('Build and Test') {
                        checkout scm
                        sh """
                            #!/bin/sh -e

                            docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
                            docker build -t ${DOCKER_USERNAME}/date-display-app:latest .
                            docker push ${DOCKER_USERNAME}/date-display-app:latest
                        """
                    }
                }
            }
        }
    }
}
