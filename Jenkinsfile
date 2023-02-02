pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t ksbhull/npm:latest -t ksbhull/npm:build-$BUILD_NUMBER .
                '''
            }
        }
        stage('Push') {
            steps {
                sh '''
                docker push ksbhull/npm:latest
                docker push ksbhull/npm:build-$BUILD_NUMBER 
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                ssh -i "~/.ssh/id_rsa" jenkins@104.197.233.99 << EOF
                 docker stop npm
                 docker rm npm
                 docker rmi ksbhull/npm:latest
                docker run -d -p 80:9090 --name npm ksbhull/npm:latest
                '''
            }
        }
    }
}