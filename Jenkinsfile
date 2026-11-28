
pipeline {
    agent any
 tools {
        maven 'maven-latest'   //maven-id given in config
    }
    
    stages {
        stage('Check Maven') {
            steps {
                sh 'mvn -version'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the application...'
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the application...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
            }
        }
    }
}
