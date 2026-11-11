def gv
pipeline{
    agent any
    tools{
        maven 'maven-latest'
    }
    stages{
        stage("init"){
            steps{
                script{
                    echo "initializing the build..."
                    df = load "script.groovy"
                }
            }
        }
        stage("build jar"){
            steps{
                script{
                   gv.buildJar()
                }
            }
        }

        stage("build image"){
            steps{
                script{
                    gv.buildImage()

                }
            }
        }
        stage("deploy"){
            steps{
                script{
                    gv.deployApp()
                }
            }
        }
    }
}