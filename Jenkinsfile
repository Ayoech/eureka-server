pipeline {
    agent any

    environment {
        IMAGE_NAME = "eureka-server"
        CONTAINER_NAME = "eureka-container"
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

        stage('Run Docker Container') {
            steps {
                // Supprimer le container s'il existe déjà
                sh "docker rm -f ${CONTAINER_NAME} || true"
                // Lancer le container
                sh "docker run -d --name ${CONTAINER_NAME} -p ${CONTAINER_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}:latest"
            }
        }
    }
}
