pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'omkarj9307'
        IMAGE_NAME = 'java-jenkins-demo'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest .'
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    sh 'docker run --rm $DOCKERHUB_USER/$IMAGE_NAME:latest'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'my-docker-hub-credentials-id', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh 'echo $PASS | docker login -u $USER --password-stdin'
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker push $DOCKERHUB_USER/$IMAGE_NAME:latest'
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up Docker environment..."
            sh 'docker system prune -f || true'
        }
    }
}
