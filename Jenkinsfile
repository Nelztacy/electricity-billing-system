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
  stage('Publish') {
        steps {
          publishRelease(mavenCommon, pipelineCommon.keystoreCredentialsId, pipelineCommon.useInstall4J)
        }
      }
      stage('Collect Distribution Files') {
        steps {
          collectDist(pipelineCommon.distFiles)
        }
      }
      stage('Finish Release') {
        steps {
          finishRelease(env, mavenCommon, params.version, params.nextVersion)
        }
    }
}
  }