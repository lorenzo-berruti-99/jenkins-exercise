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
			echo "Build (Declarative Pipeline)"
		}
		stage('Test') {
			echo "Test (Declarative Pipeline)"
		}
		stage('Deploy') {
			echo "Deploy"
		}
	}
	post {
		always {
			echo "Always"
		}
		success {
			echo "Success"
		}
		failure {
			echo "Failure"
		}
	}
}