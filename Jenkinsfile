pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('build & SonarQube analysis') {
      steps {
        withSonarQubeEnv('My SonarQube Server') {
                sh 'mvn clean package sonar:sonar'
              }
      }
    }
    
    stage('Build') {
      steps {
        sh "mvn clean package"
            }
    }
    stage('Unit test'){
      steps {
        sh "mvn test"
      }
    }
    stage('Integration testing'){
      steps{
        sh 'mvn verify -DskipUnitTests'
      }
   }
  }
}