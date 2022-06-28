Vagrant.configure("2") do |config|
  
  config.vm.define "run1" do |run1|
    run1.vm.box = "ubuntu/xenial64"
    run1.vm.network "private_network", ip: "192.168.101.1"
    run1.vm.synced_folder "./docker", "/home/vagrant/docker"
    run1.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = "2048"
    end
    run1.vm.provision "shell" do |shell|
      shell.path = "./docker/docker.sh"
    end
  end

  config.vm.define "prod" do |prod|
    prod.vm.box = "ubuntu/xenial64"
    prod.vm.network "private_network", ip: "192.168.101.2"
    prod.vm.synced_folder "./key", "/home/vagrant/key"
    prod.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = "2048"
    end
    prod.vm.provision "shell" do |shell|
      shell.path = "./docker/prod.sh"
    end
  end

end