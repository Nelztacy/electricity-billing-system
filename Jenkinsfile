pipeline {
    agent any
    
    environment {
        TOMCAT_HOME = '/opt/tomcat'  // Set the path to your Tomcat installation
        APP_NAME = 'BGE'        // Set your application name
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from your version control system (e.g., Git)
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                // Build your Java application (if necessary)
                sh 'mvn clean package'  // You can adjust this based on your build tool
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                // Stop the Tomcat server
                sh "${TOMCAT_HOME}/bin/shutdown.sh"
                
                // Remove the existing application files
                sh "rm -rf ${TOMCAT_HOME}/webapps/${BGE}*"
                
                // Copy the JAR file to the webapps directory
                sh "cp target/your-app-name.jar ${TOMCAT_HOME}/webapps/${BGE}.jar"
                
                // Start the Tomcat server
                sh "${TOMCAT_HOME}/bin/startup.sh"
            }
        }
    }
    
    post {
        success {
            // Notify on successful deployment, run additional steps, etc.
        }
    }
}
