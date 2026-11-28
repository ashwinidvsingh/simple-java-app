pipeline {
    agent any

    tools {
        // Must exactly match the name in Manage Jenkins -> Tools -> Maven installations
        maven 'maven-latest'
    }

    environment {
        // Docker Hub credential (username + access token) stored in Jenkins
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = 'ashwinidvsingh/docker-push-repo'
        IMAGE_TAG  = '1.0'
    }

    stages {
        stage('Build with Maven') {
            steps {
                echo 'Building the project with Maven...'
                // -B = batch mode (cleaner logs for Jenkins)
                // clean package = clean previous builds and package the new .jar
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Docker Push') {
            steps {
                echo 'Logging into Docker Hub and pushing the image...'
                // Password is read from the credential binding, never hardcoded
                sh 'echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin'
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully! Image pushed to Docker Hub.'
        }
        failure {
            echo 'Pipeline failed. Check the logs above.'
        }
        always {
            // Remove credentials from the agent after the run
            sh 'docker logout || true'
        }
    }
}
