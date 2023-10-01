pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage ('SAST') {
		steps {
		withSonarQubeEnv('sonar') {
			sh 'mvn sonar:sonar'
			sh 'cat target/sonar/report-task.txt'
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
     stage('Deploy artifacts to server') {
        steps {
          no public field ‘deployer’ (or getter method) found in class org.jfrog.hudson.pipeline.scripted.steps.DeployStep
        }
    
}
  }
}