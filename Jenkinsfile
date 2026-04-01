// Scripted Pipeline
//node {
//	stage('Build') {
//		echo "Build (Scripted Pipeline)"
//	}
//	stage('Test') {
//		echo "Test (Scripted Pipeline)"
//	}
//	stage('Deploy') {
//		echo "Deploy (Scripted Pipeline)"
//	}
//}

// Declarative Pipeline
//pipeline {
//	agent any
//	stages {
//		stage('Build') {
//			steps {
//				echo "Build (Declarative Pipeline)"
//			}
//		}
//		stage('Test') {
//			steps {
//				echo "Test (Declarative Pipeline)"
//			}
//		}
//		stage('Deploy') {
//			steps {
//				echo "Deploy (Declarative Pipeline)"
//			}
//		}
//	}
//	post {
//		always {
//			echo "Always (Declarative Pipeline)"
//		}
//		success {
//			echo "Success (Declarative Pipeline)"
//		}
//		failure {
//			echo "Failure (Declarative Pipeline)"
//		}
//	}
//}


// Declarative Pipeline with Docker agent
pipeline {
    agent none // Non definisco un agente globale
    environment {
        // Forza Jenkins a usare i certificati montati nel container
        DOCKER_TLS_VERIFY = '1'
        DOCKER_CERT_PATH = '/certs/client'
        DOCKER_HOST = 'tcp://docker:2376'
    }
	stages {
        stage('Test su Node') {
            agent {
                docker { 
                    image 'node:18-slim' 
                    // Jenkins dirà al container dind: 
                    // "Scarica node:18 e fammi girare questi comandi lì dentro"
                }
            }
            steps {
                sh 'node --version'
                sh 'npm install'
            }
        }
        stage('Test su Python') {
            agent {
                docker { image 'python:3.10-alpine' }
            }
            steps {
                sh 'python --version'
            }
        }
    }
}