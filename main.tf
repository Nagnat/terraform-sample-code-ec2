provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "example" {
  ami                  = "ami-0f88e80871fd81e91"  # amazon linux3
  #ami                   = "ami-084568db4383264d4"  #ubuntu 24.04
  instance_type        = "t2.micro"
  key_name             = "test"
  subnet_id            = "subnet-0b9c4bccaa38ddc70"
  security_groups      = ["sg-0ebe4a39a666a56be"]
  iam_instance_profile = "test"
  

# user_data = <<-EOF
# #!/bin/bash

# sudo yum update -y
# sudo yum install docker -y
# sudo service docker start
# sudo usermod -aG docker ec2-user
# docker pull jenkins/jenkins:lts
# docker run -d -p 8080:8080 -p 50000:50000 --name jenkins jenkins/jenkins:lts
# # docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword

# EOF

# user_data = <<-EOF
#!/bin/bash
   
  #  sudo apt install postgresql-client
#   yum update -y              # Update packages
#   yum install -y httpd       # Install Apache
#   systemctl start httpd      # Start Apache service
#   systemctl enable httpd     # Enable it on startup
#   <!DOCTYPE html>
# <html lang="en">
# <head>
#     <meta charset="UTF-8">
#     <meta name="viewport" content="width=device-width, initial-scale=1.0">
#     <title>AWS S3 Image on EC2</title>
# </head>
# <body>
#     <h1>Image from AWS S3</h1>
#     <img id="s3Image" src="https://your-s3-bucket.s3.amazonaws.com/sample-image.jpg" alt="S3 Hosted Image">
# </body>
# </html>

  # EOF

  tags = {
    Name = "MyEC2Instance"
  }
}
