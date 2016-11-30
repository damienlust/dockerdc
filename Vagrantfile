
Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "master" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.hostname = "master"
    #d.vm.provision "docker"
    d.vm.provision :shell, path: "bootstrapmaster.sh"
    d.vm.network "private_network", ip: "10.100.198.200"
    #d.vm.network "forwarded_port", guest: 80, host: 8088
d.vm.network "forwarded_port", guest: 9898, host: 9899
    d.vm.provider "virtualbox" do |v|
    v.memory = 2048
    end
  end
config.vm.define "docker-registry" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.hostname = "docker-registry"
    d.vm.provision "docker" 
    d.vm.network "forwarded_port", guest: 5000, host: 5000
    d.vm.network "private_network", ip: "10.100.199.200"
    d.vm.provider "virtualbox" do |v|
    v.memory = 2048
    end
  end
 (1..4).each do |i|
    config.vm.define "node-#{i}" do |d|
      d.vm.box = "ubuntu/trusty64"
      d.vm.hostname = "node-#{i}"
       d.vm.provision :shell, path: "bootstrapnode.sh"
      d.vm.network "private_network", ip: "10.100.198.20#{i}"
      d.vm.provider "virtualbox" do |v|
        v.memory = 1536
      end
    end
  end
 end

