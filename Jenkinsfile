pipeline {
  agent any
  tools{
    maven "Maven"
  }

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
    // stage ('Check-Git-Secrets') {
	//     steps {
	//         sh 'rm trufflehog || true'
	// 	    sh 'docker pull gesellix/trufflehog'
	// 	    sh 'docker run -t gesellix/trufflehog --json https://github.com/Nelztacy/electricity-billing-system.git > trufflehog'
	// 	    sh 'cat trufflehog'
	//     }
    // }
    
    stage('Build') {
        steps {
            sh "mvn clean package"
                }
                post{
                success{
                    echo "Archiving the Artifacts"
                    archiveArtifacts artifacts: "**/target/*.jar"
                }
            }
    }
    stage('Unit test'){
        steps {
            sh "mvn test"
      }
    }
//       stage('Deploy artifacts to Tomcat-Server'){
//       steps{
//         no public field ‘deployer’ (or getter method) found in class org.jfrog.hudson.pipeline.scripted.steps.DeployStep
//       }
//    }
  }
}