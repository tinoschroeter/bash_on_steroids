Vagrant.configure("2") do |config|
config.vm.define "bos" do |bos|
  bos.vm.hostname = "bos"
  bos.vm.box = "precise64"
  bos.vm.provision "shell", path: "install"
  bos.vm.network "forwarded_port", guest: 80, host: 9090
  bos.vm.synced_folder ".", "/home/vagrant"
  end
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
  end
end

