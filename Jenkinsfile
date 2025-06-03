pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1' // Set your AWS region
        SSH_KEY = credentials('ec2-ssh-key')  // Use stored SSH key
        EC2_IP = '172.31.86.157' // Replace with actual EC2 IP
        REMOTE_PATH = "/home/ec2-user/terraform" // Path to Terraform scripts
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Nagnat/terraform-sample-code-ec2.git' // Replace with your repo
            }
        }
        stage('Transfer Files to EC2') {
            steps {
                sh '''
                scp -i $SSH_KEY -r . ec2-user@$EC2_IP:$REMOTE_PATH
                '''
            }
        }
        stage('Terraform Init') {
            steps {
                sh '''
                ssh -i $SSH_KEY ec2-user@$EC2_IP "cd $REMOTE_PATH && terraform init"
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                ssh -i $SSH_KEY ec2-user@$EC2_IP "cd $REMOTE_PATH && terraform plan -out=tfplan"
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh '''
                ssh -i $SSH_KEY ec2-user@$EC2_IP "cd $REMOTE_PATH && terraform apply -auto-approve tfplan"
                '''
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution complete!'
        }
    }
}
