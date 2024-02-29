# kali-automation
Automating Kali configuration and deployment with Vagrant and Ansible.
The script will create a customized Kali VM, tools will be installed as root or as the user `vagrant`.

It uses the prebuilt kalilinux/rolling box from vagrant cloud and applies customizations and tweaks via the remote ansible provisioner. Therefore, you have to have ansible and vagrant installed on your system (using a vm-local provisioner is outlined below).

## How to use

### Create an Ansible Vault
### Adjust variables

In `vars.yml` you can adjust your desired keyboard layout and specify a folder for installing tools.
Per default this is `/home/vagrant/Tools`.

### Spawn the VM

For keyboard Shortcuts to be applied correctly, one has to first login to a GUI Session before provisiong.
For this, simply run `vagrant up --no-provision` and log in with the default credentials `vagrant:vagrant`.

### Provision the VM
After logging in initially run `vagrant provision` to apply your desired configuration using Ansible.
Ansible will prompt for your ansible vault passphrase shortly after starting provisioning.

## Tips regarding customization
 
### Using a local Ansible provisioner

To use a vm-local ansible provisioner instead, one has to make some adjustments to the vagrantfile, namely:
- Change `config.vm.provision "ansible"` to `config.vm.provision "ansible_local"`
- Specify the requirements.yml by adding `ansible.galaxy_role_file = "requirements.yml"` to the `|ansible|` block
- Remove `ansible.ask_vault_pass = true` as asking for the vaultpassword is not supported using local provisioning. Instead a keyfile has to be provided, i.e. by specifying `ansible.vault_password_file = "vaultpass.txt"`, where `vaultpass.txt` contains the passphrase for your ansible vault.
  
### Using tags

Should you want to exclude certain customization steps, i.e. if you are not using the XFCE desktop environment, you can specify `ansible.skip_tags = "tag1 [, tag2 ...]"` in the Vagrantfile. You can only partially apply tags like this `ansible.tags = "tag1 [, tag2 ...]"`.

### Customizing an XFCE desktop environment

For customizing the XFCE DE you can use the [xfconf module](https://docs.ansible.com/ansible/latest/collections/community/general/xfconf_module.html).
To see the kinds of changes you can apply simply check out XFCE's config files in the directory `~/.config/xfce4/xfconf/xfce-perchannel-xml`.
You can find examples of how to interact with these config files in `build/roles/config/tasks/xfce.yml`.
