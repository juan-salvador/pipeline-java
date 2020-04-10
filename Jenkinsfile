pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make deploy'
            }
        }
        stage('Functional Test'){
            steps {
                sh 'make run-postman'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}