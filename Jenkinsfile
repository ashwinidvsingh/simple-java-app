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
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    // env.IMAGE_VERSION = matcher[0][1]
                    def version = matcher[0][1]
                    env.IMAGE_VERSION = "$version-$BUILD_NUMBER"
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