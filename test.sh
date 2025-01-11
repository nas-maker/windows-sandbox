#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install essential build tools and dependencies
echo "Installing essential build tools and dependencies..."
sudo apt-get install -y build-essential libssl-dev libffi-dev curl wget git unzip

# Install Python
echo "Installing Python..."
sudo apt-get install -y python3 python3-pip python3-venv
python3 --version

# Install Node.js using NodeSource
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
node --version
npm --version

# Install Git
echo "Installing Git..."
sudo apt-get install -y git
git --version

# Install VS Code
echo "Installing VS Code..."
sudo apt-get install -y software-properties-common apt-transport-https
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update -y
sudo apt-get install -y code
code --version

# Install Miniconda
echo "Installing Miniconda..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p "$HOME/miniconda3"
rm miniconda.sh
# Add Miniconda to PATH
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
conda --version

# Install NVM (Node Version Manager)
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# Load NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm --version

# Install additional tools (optional)
echo "Installing additional tools..."
sudo apt-get install -y htop tree jq

# Install Docker (optional)
echo "Installing Docker..."
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
docker --version

# Install Docker Compose (optional)
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Install Postman (optional)
echo "Installing Postman..."
sudo snap install postman

# Install Insomnia (optional)
echo "Installing Insomnia..."
sudo snap install insomnia

# Install Zsh and Oh-My-Zsh (optional)
echo "Installing Zsh and Oh-My-Zsh..."
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clean up
echo "Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get clean

# Final message
echo "Setup complete! Your VM is ready for coding."
echo "Please restart your terminal or run 'source ~/.bashrc' to apply changes."
