pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "eureka-server:latest"
    }

    stages {
        stage('Clone repo') {
            steps {
                git 'https://github.com/ton-utilisateur/ton-repo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/eureka-deployment.yaml'
            }
        }
    }

    post {
        success {
            echo 'Déploiement réussi 🚀'
        }
        failure {
            echo 'Le pipeline a échoué ❌'
        }
    }
}
