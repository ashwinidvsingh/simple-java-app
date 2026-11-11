pipeline{
    agent any
    tools{
        maven 'maven-latest'
    }
    stages{
        stage("build jar"){
            steps{
                script{
                    echo "building the application..."
                    sh 'mvn package'
                }
            }
        }

        stage("build image"){
            steps{
                script{
                    echo "Building the docker image..."
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                        sh 'docker build -t ashwinidvsingh/app-image-build-docker:1.1 .'
                        sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                        sh 'docker push ashwinidvsingh/app-image-build-docker:1.1'
                    }

                }
            }
        }
        stage("deploy"){
            steps{
                script{
                    echo "Deploying the application..."

                }
            }
        }
    }
}