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
                        credentialsId: '6f7aaeaa-7ecf-43b8-b1fb-4f1758015d56'
                    ]]
                ])
            }
        }

        stage('Build Gradle Project') {
            steps {
                sh 'chmod +x ./gradlew'
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
