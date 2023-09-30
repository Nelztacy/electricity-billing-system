pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
     stage('SonarQube analysis') {
      steps {
        script {
          // requires SonarQube Scanner 2.8+
          scannerHome = tool 'SonarQube Scanner 2.8'
        }
        withSonarQubeEnv('SonarQube Scanner') {
          sh "${scannerHome}/bin/sonar-scanner"
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