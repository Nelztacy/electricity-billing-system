pipeline{

    agent any

    stages{

        stage('Git Checkout'){

            steps{

               script{

                git branch: 'main', url: 'git@github.com:Nelztacy/olowo-java-demo.git'
               }
            }
        }
    }
}