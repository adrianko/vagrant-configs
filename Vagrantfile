Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :private_network, ip: "192.168.33.2"
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.name = "lamp"
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  config.vm.provision :puppet do |puppet|
  	puppet.options = ["--user", 'root']
    puppet.manifests_path = ""
    puppet.manifest_file  = "lamp.pp"
  end
end
