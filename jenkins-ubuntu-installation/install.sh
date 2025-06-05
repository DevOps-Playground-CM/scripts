#!bin/bash
# This script will be used to automate the installation java and jenkins server.
# install java + jenkins
# enable and start jenkins and jenkins status

 # Updating  system packages
echo "Updating system packages... update the server to refesh the system by downloading new packages."
sudo apt update -y

# Installing Java
echo "Installing Java... "
echo "Running this command installs Java's development tools, which are required for compiling and running Java programs "
sudo apt install openjdk-17-jdk


# Installing Jenkins
echo "Runnig this below command  You will  fetching and saving a public key for Jenkins package authentication. 
This ensures that when you install Jenkins, your system verifies that the packages come from a trusted source. "
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "Running this command adds the Jenkins repository to your system's package sources. 
This repository contains the latest stable version of Jenkins. "  
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
echo "update the server to refesh the system by downloading new packages"  
sudo apt-get update -y
echo "This command will download and install Jenkins from the specified repository. "
sudo apt-get install jenkins -y

# Starting and enabling Jenkins
echo "Starting and enabling Jenkins to start the Jenkins service and to enable it to start on system boot. "
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Displaying the initial admin password 

echo "Initial admin password for Jenkins: cat into this file to get this admin password, 
that will be used to access the jenkins server "
SERVERIP=$(curl ifconfig.me)
JENKINSURL="http://$SERVERIP:8080"
echo "Jenkins URL: $JENKINSURL"
echo "Jenkins initial admin password: $(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)"
