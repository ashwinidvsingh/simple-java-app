#!/usr/bin/env groovy

// @Library('jenkins-shared-library') _
library identifier: 'jenkins-shared-library@master', retriever: modernSCM([
    $class: 'GitSCMSource',
    remote: 'https://github.com/ashwinidvsingh/jenkins-shared-library.git'
]);

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
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar"){
            steps{
                script{
                    buildJar()
                }
            }
        }

        stage("build image"){
            steps{
                script{
                    buildImage 'ashwinidvsingh/app-image-build-docker:1.2'
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