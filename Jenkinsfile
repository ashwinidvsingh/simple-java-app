
pipeline {
    agent any
 tools {
        maven 'maven-latest'   // must match the name in Jenkins Global Tool Configuration
    }
    
    stages {
        stage('Check Maven') {
            steps {
                sh 'mvn -version' //maven version check
               sh 'mvn build-helper:parse-version versions:set -DnewVersion=\'${parsedVersion.majorVersion}.${parsedVersion.minorVersion}.${parsedVersion.nextIncrementalVersion}\' -DgenerateBackupPoms=false'
            }
        }
        stage('Commit & Push pom.xml') {
            steps {
                // 1. Configure Git commit identity (required, otherwise commit will fail)
                sh '''
                    git config user.name "Jenkins CI"
                    git config user.email "jenkins@your-domain.com"
                '''
                
                // 2. Commit changes (|| echo prevents pipeline interruption when there are no changes)
                sh '''
                    git add pom.xml
                    git commit -m "ci: bump patch version [skip ci]" || echo "No changes to commit"
                '''
                
                // 3. Use Jenkins credentials to push securely
                withCredentials([usernamePassword(
                    credentialsId: 'GITHUB_CREDS',
                    usernameVariable: 'GIT_USER',
                    passwordVariable: 'GIT_PASS'
                )]) {
                    sh '''
                        git push https://${GIT_USER}:${GIT_PASS}@github.com/ashwinidvsingh/simple-java-app.git HEAD:automatic-build-pipeline
                    '''
                }
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
