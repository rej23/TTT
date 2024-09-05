#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Update package list
echo "Updating package list..."
sudo apt update

# Install required packages
echo "Installing required packages..."
sudo apt install -y python3 python3-pip python3-venv

# Create a virtual environment
echo "Creating virtual environment..."
python3 -m venv ~/ansible_env

# Activate the virtual environment
echo "Activating virtual environment..."
source ~/ansible_env/bin/activate

# Install Ansible and Kubernetes module
echo "Installing Ansible and Kubernetes module..."
pip install ansible kubernetes

# Install Ansible Kubernetes collection
echo "Installing Ansible Kubernetes collection..."
ansible-galaxy collection install kubernetes.core

# Verify installations
echo "Verifying installations..."
ansible --version
python -c "import kubernetes; print(kubernetes.__version__)"
ansible-galaxy collection list | grep kubernetes

echo "Setup complete!"

# Deactivate the virtual environment
deactivate

echo "To use this environment, run: source ~/ansible_env/bin/activate"

###############################
# chmod +x setup.sh
# ./setup.sh
###############################