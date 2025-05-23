pipeline {
    agent any

    environment {
        IMAGE_NAME = "eureka-server"
        CONTAINER_PORT = "8761"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/ton-utilisateur/ton-repo.git'
            }
        }

        stage('Build Gradle Project') {
            steps {
                sh './gradlew build'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Delete Existing K8s Resources') {
            steps {
                sh "kubectl delete deployment eureka-deployment --ignore-not-found"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f deployment.yaml"
            }
        }
    }
}
