hostname = 'srv-icinga2'
box = 'bento/debian-8.7'
net = 'demo.local'
hostonly = '172.16.1.5'
memory = '2048'
cpus = '2'

Vagrant.configure(2) do |config|
  config.vm.box = box
  config.vm.hostname = hostname
  config.vm.network "private_network", ip: hostonly
  config.vm.network "forwarded_port", guest: 22, host: 2082

  config.vm.provider "virtualbox" do |vb|
    # vb.linked_clone = true
    vb.name = hostname
    vb.cpus = cpus
    vb.memory = memory
    vb.gui = false
  end

  # config.vm.provision "shell", inline: "service networking restart", run: "always"

  config.vm.provision "shell", path: "./scripts/shell_provisoner.sh"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "./playbooks/playbook.yml"
    ansible.install_mode = "pip"
    # ansible.version = "2.3.1.0"
  end
end
