# Jenkins Installation  Script for Ubuntu
__________________________________________________________________________________________________________________________________

**Introdution**: Do you know that automating a process can help ease work by reducing the time that the work was suppose to be done and 
also avoiding errors? This readme.md  file will help explain how this "Ubuntu installation script" will be used to install Jenkins on an Ubuntu server and everything you will need to carrry out the automation process. 

## **Content**

```install.sh ```  Installion script.

`README.md` Documentation.

## **Prerequisites/Pre-requirements**

- A server running Ubuntu with sudo access.

- Port, 8080, 22, 80 must be open to access the Jenkins web interface.

- Minimum 1 GB RAM (recommended: 4 GB RAM).

- Minimum 1 CPU cores.

- At least 8 GB of free disk space for Jenkins and its dependencies.

- Stable Internet connection to download dependencies and Jenkins binaries.

## **How to use this script**

- You can clone this folder from `git clone https://github.com/DevOps-Playground-CM/scripts.git`.
- cd scripts/install.sh.
- Run `chmod +x install.sh` to grant executable permission to the script.
- Run the script according to your OS.

 ## **Accessing the server**
- You find the public ip after the script has been executed.
- Access jenkins server via: `http://<your_server_ip>:8080`

Default login credentials
Username: admin

Password: admin
