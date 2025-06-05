# Docker Auto-Installation Script

An automated script for installing Docker on Ubuntu systems with proper permissions and group settings.

## Features

- ✨ Automatic Ubuntu version detection
- 🔒 Proper permission handling
- 🔄 Automatic repository and GPG key setup
- 👥 User group configuration
- 🚀 Systemd service setup
- ✅ Installation verification

## Prerequisites

- Ubuntu operating system (14.04 or newer)
- Sudo privileges
- Internet connection
- Basic command line tools (`curl`, `apt`)

## Installation

1. Download the script:
```bash
wget https://raw.githubusercontent.com/yourusername/docker-installer/main/install-docker.sh
```

2. Make it executable:
```bash
chmod +x install-docker.sh
```

3. Run the script:
```bash
./install-docker.sh
```

## What Does It Do?

1. Checks for sudo privileges and requests if needed
2. Detects Ubuntu version
3. Installs required dependencies
4. Based on Ubuntu version:
   - Ubuntu 14.04: Installs via `docker.io`
   - Ubuntu 16.04: Uses legacy Docker CE method
   - Newer versions: Installs latest Docker CE
5. Configures Docker service
6. Sets up user permissions
7. Verifies installation

## Post-Installation

After successful installation, you have two options:

1. Log out and log back in (Recommended)
2. Run the following command for immediate effect:
```bash
newgrp docker
```

## Verification

Test your Docker installation:
```bash
docker --version
docker run hello-world
```

## Troubleshooting

If you encounter issues:

1. Check Docker service status:
```bash
systemctl status docker
```

2. Verify group membership:
```bash
groups $USER
```

3. Check Docker socket permissions:
```bash
ls -l /var/run/docker.sock
```

4. Common fixes:
   - If Docker socket permission denied: `sudo chmod 666 /var/run/docker.sock`
   - If group membership issues: `sudo usermod -aG docker $USER`
