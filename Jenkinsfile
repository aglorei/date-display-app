label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
    containerTemplate(name: 'docker-build', image: 'docker:latest ', ttyEnabled: true, command: 'cat'),
  ]) {
    node(label) {
        stage('Build') {
            container('docker-build') {
                stage('Build and Test') {
                    checkout scm
                    sh '''
                        #!/bin/sh
                        ls -alhHF
                    '''
                }
            }
        }
    }
}
