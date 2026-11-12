#!/usr/bin/env groovy

@Library('jenkins-shared-library')
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
                    buildImage()
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