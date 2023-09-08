pipeline {
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    agent any
    stages{
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url:'https://github.com/tushar-fundflo/policy']])
            }
        }
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }
        
        stage ("plan") {
            steps {
                sh ('terraform plan') 
            }
        }

        stage (" Apply") {
            steps {
                
                sh ('terraform apply --auto-approve') 
           }
        }
    }
}
