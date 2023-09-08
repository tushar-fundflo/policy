pipeline {
    //environment {
      //  AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        //AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    //}
    agent any
    stages{
        //stage('AWS_LOGIN') {
          //  steps {
            //    withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
            // some block
            //}
           // }
            //   }
        stage{
            steps{
                withCredentials([string(credentialsId: 'AWS_ID', variable: '')]){
                    script {
                        env.AWS_ACCESS_KEY_ID = creds['ACCESS_KEY_ID']
                        env.AWS_SECRET_ACCESS_KEY = creds['SECRET_ACCESS_KEY']
                        env.AWS_REGION = 'ap-south-1'
                    }
                }
            }
        }
        stage{
            steps {}
        }
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/tushar-doc/SQS-Auto.git']])
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
