# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.require_version ">= 1.8.0"
Vagrant.configure("2") do |config|
  config.vm.define "custom-kali" do |vm|
    config.vm.box = "kalilinux/rolling"
    config.vm.box_check_update = true
    config.vm.provider "virtualbox" do |v|
      v.gui = true
      v.memory = 24576
      v.cpus = 6
      v.check_guest_additions = true
      v.name = "pwnbox"
    end
    config.vm.hostname = "pwnbox"
    config.vm.synced_folder "/home/seili/Workspace/CTF/VPNs", "/home/vagrant/CTF/VPNs"
    config.vm.synced_folder "/home/seili/Workspace/CTF/Notes", "/home/vagrant/CTF/Notes"
    config.vm.synced_folder "/home/seili/Workspace/CTF/Dots", "/home/vagrant/CTF/Dots"
    config.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "build/build.yml"
      ansible.ask_vault_pass = true
      ansible.compatibility_mode = "2.0"
      #ansible.skip_tags = "xfce"
      #ansible.vault_password_file = "vaultpass.txt"
      #ansible.galaxy_role_file = "requirements.yml"
    end
  end
end
