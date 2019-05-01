label = "tien-${UUID.randomUUID().toString()}"
podTemplate(
    label: label,
    containers: [
        containerTemplate(name: 'docker-build', image: 'docker:18.09.5', ttyEnabled: true, command: 'cat')
    ],
    volumes: [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
    ]
){
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

                            docker info

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
