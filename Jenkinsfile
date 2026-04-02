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


// Declarative Pipeline that builds a Docker image and pushes it to Docker Hub
pipeline {
    agent any // Definisco un agente globale
    environment {
        // Forza Jenkins a usare i certificati montati nel container
        DOCKER_TLS_VERIFY = '1'
        DOCKER_CERT_PATH = '/certs/client'
        DOCKER_HOST = 'tcp://docker:2376'

        // Set repository and tag of the image to build
        REPOSITORY = 'lorenzoberruti/lorenzo'
        TAG = 'python-jenkins-pipeline'
    }
	stages {
        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image ${env.REPOSITORY}:${env.TAG}"
                
                script {
                    dockerImage = docker.build("${env.REPOSITORY}:${env.TAG}")
                }
            }
        }
        stage('Test Docker Image') {
            agent {
                docker {
                    image "${env.REPOSITORY}:${env.TAG}"
                }
            }
            steps {
                echo "Testing Docker Image ${env.REPOSITORY}:${env.TAG}"
                sh "python --version"
                sh "python main.py"
            }
        }
        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker Image ${env.REPOSITORY}:${env.TAG}"

                script {
                    docker.withRegistry('', 'dockerhub') {
                            dockerImage.push()
                    }
                }
            }
        }
    }
}