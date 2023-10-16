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
    stage ('Static Application Security Testing = SAST') {
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
    
    stage('Build Artifact') {
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
    stage ('Source-Composition-Analysis') {
	    steps {
		     sh 'rm owasp-* || true'
		     sh 'wget https://raw.githubusercontent.com/devopssecure/webapp/master/owasp-dependency-check.sh'	
		     sh 'chmod +x owasp-dependency-check.sh'
		     sh 'bash owasp-dependency-check.sh'
		     sh 'cat /var/lib/jenkins/OWASP-Dependency-Check/reports/dependency-check-report.xml'
		}
	}
    // stage ('Deploy-To-Tomcat') {
    //     steps {
    //     sshagent(['jenkins']) {
    //             sh 'scp -o StrictHostKeyChecking=no target/*.jar jenkins@10.0.0.101:/opt/tomcat/apache-tomcat-10.1.13/webapps/'
    //           }     
    //        }      
    // }
    stages {
        stage('Copy JAR to Tomcat') {
            steps {
                script {
                    def remoteHost = '10.0.0.101'
                    def remoteUser = 'jenkins'
                    def remoteDir = '/opt/tomcat/apache-tomcat-10.1.13/webapps/'
                    def jarFileName = '*.jar'
                    def localFilePath = "/var/lib/jenkins/workspace/electricity-billing-system/target/${jarFileName}"
                    
                    sh "scp ${localFilePath} ${remoteUser}@${remoteHost}:${remoteDir}"
                }
            }
        }
    }
  }
}


// /var/lib/jenkins/workspace/electricity-billing-system/target
