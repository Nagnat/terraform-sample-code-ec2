pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1' // Set your AWS region
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Nagnat/terraform-sample-code-ec2.git' // Replace with your repo
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution complete!'
        }
    }
}
