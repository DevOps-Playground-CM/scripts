# Jenkins Installation  Script for Ubuntu
_________________________________________________________________________________________________________________________________
_
**Introdution**: Do you know that automating a process can help ease work by reducing the time that the work was suppose to be done and 
also avoiding errors? This readme.md  file will help explain how this "Ubuntu installation script" will be used to install Jenkins on an Ubuntu server and everything you will need to carrry out the automation process. 

## **Content**

`install.sh`  Installion script.

`README.md` Documentation.

## **Prerequisites/Pre-requirements**

- A server running Ubuntu with sudo access.

- Port, 8080, 22, 80 must be open to access the Jenkins web interface.

- Minimum 1 GB RAM (recommended: 4 GB RAM).

- Minimum 1 CPU cores.

- At least 8 GB of free disk space for Jenkins and its dependencies.

- Stable Internet connection to download dependencies and Jenkins binaries.

## **How to use this script**

- You can clone the folder from `git clone https://github.com/DevOps-Playground-CM/scripts-devopsplay.git`.
- cd scripts-devopsplay/
- cd ubuntu-installation
- Run `sudo chmod +x install.sh` to grant executable permission to the script.
- Run the script according to your OS.


 ## **Accessing the server**
- You find everytjin you need to access the server after executing the script.
  For example you will see something like this below
Jenkins URL: `http://3.80.131.181:8080`
Jenkins initial admin password: `2591bdaa272e4c769d099f646dd761e6`
- Copy the  Jenkins URL to access the server.
- Copy the admin pass word and login to the Jenkins server.
