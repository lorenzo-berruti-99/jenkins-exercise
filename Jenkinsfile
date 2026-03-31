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
pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				echo "Build (Declarative Pipeline)"
			}
		}
		stage('Test') {
			steps {
				echo "Test (Declarative Pipeline)"
			}
		}
		stage('Deploy') {
			steps {
				echo "Deploy (Declarative Pipeline)"
			}
		}
	}
	post {
		always {
			echo "Always (Declarative Pipeline)"
		}
		success {
			echo "Success (Declarative Pipeline)"
		}
		failure {
			echo "Failure (Declarative Pipeline)"
		}
	}
}