#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update -y
sudo apt install software-properties-common -y

# Install Ansible
echo "Installing Ansible..."
sudo apt install ansible -y

echo "Installing VBox Guest Addition Dependencies..."
sudo apt install dkms build-essential linux-headers-$(uname -r)

echo "Installing Ansible Community Plugins..."
ansible-galaxy install gantsign.visual-studio-code

# Run the Ansible playbook
PLAYBOOK_PATH="build.yml"

if [ -f "$PLAYBOOK_PATH" ]; then
  echo "Running Ansible playbook..."
  ansible-playbook "$PLAYBOOK_PATH" -e "username=$USER"
else
  echo "Playbook not found at $PLAYBOOK_PATH. Exiting."
  exit 1
fi

echo "Ansible playbook run ended!"
