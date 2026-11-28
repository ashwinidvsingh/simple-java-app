
pipeline {
    agent any
 tools {
        maven 'maven-latest'   // must match the name in Jenkins Global Tool Configuration
    }
    
    stages {
        stage('Check Maven') {
            steps {
                sh 'mvn -version'
               sh 'mvn build-helper:parse-version versions:set -DnewVersion=\'${parsedVersion.majorVersion}.${parsedVersion.minorVersion}.${parsedVersion.nextIncrementalVersion}\' -DgenerateBackupPoms=false'
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
