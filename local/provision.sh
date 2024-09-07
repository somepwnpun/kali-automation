#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update -y

# Install Ansible
echo "Installing Ansible..."
sudo apt install ansible -y

# Run the Ansible playbook
PLAYBOOK_PATH="kali-automation/local/build.yml"

if [ -f "$PLAYBOOK_PATH" ]; then
  echo "Running Ansible playbook..."
  ansible-playbook "$PLAYBOOK_PATH"
else
  echo "Playbook not found at $PLAYBOOK_PATH. Exiting."
  exit 1
fi

echo "Ansible playbook executed successfully!"
