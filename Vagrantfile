Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  # host-only ip
  config.vm.network :private_network, ip: "192.168.33.2"
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    # change name if required
    vb.name = "ngpp"
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  config.vm.provision :puppet do |puppet|
    puppet.options = ["--user", 'root']
    puppet.manifests_path = ""
    # change to ngpp.pp if required
    puppet.manifest_file  = "ngpp.pp"
  end
end
