pipeline {
    agent any

    environment {
        IMAGE_NAME = "eureka-server"
        CONTAINER_NAME = "eureka-container"
        CONTAINER_PORT = "8761"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    userRemoteConfigs: [[
                        url: 'https://github.com/Ayoech/eureka-server',
                        credentialsId: 'd69f0a09-2e91-40f9-9c00-fd6687d0222e'
                    ]]
                ])
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
