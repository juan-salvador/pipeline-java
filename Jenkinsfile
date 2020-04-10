pipeline {
    agent any
    parameters {
        booleanParam(name: 'UNIT_TEST', defaultValue: true, description: 'Run unit test')
        booleanParam(name: 'DEPLOY', defaultValue: true, description: 'Deploy application')
        booleanParam(name: 'FUNCTIONAL_TEST', defaultValue: true, description: 'Run functional test')
    }
    stages {
        stage('Build') {
            steps {
                script{
                    if("${params.DEPLOY}" == "true") {
                        sh 'make build'
                        sh 'make push'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script{
                    if("${params.UNIT_TEST}" == "true") {
                        sh 'mvn test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script{
                    if("${params.DEPLOY}" == "true") {
                        sh 'make deploy'
                    }
                }
            }
        }
        stage('Functional Test'){
            steps {
                script{
                    if("${params.FUNCTIONAL_TEST}" == "true") {
                        sh 'make run-postman'
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}