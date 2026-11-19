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
        stage("versioning"){
            steps{
                script{
                    echo "Versioning the build..."
                    sh 'mvn build-helper:parse-version versions:set -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} versions:commit'
                    def matcher = readfile('pom.xml') =~ '<version>(.+)</version>'
                    env.IMAGE_VERSION = matcher[0][1]
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
                    buildImage "ashwinidvsingh/app-image-build-docker:${env.IMAGE_VERSION}"
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