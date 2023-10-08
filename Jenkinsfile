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
    stage ('Deploy-To-Tomcat') {
            steps {
           sshagent(['tomcat']) {
                sh 'scp -o StrictHostKeyChecking=no target/*.jar tomcat@10.0.0.101:tomcat/webapps/webapp.jar'
              }     
           }      
    } 
  }
}