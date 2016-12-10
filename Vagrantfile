Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"

  config.vm.define :debian8 do |server|
  
    server.vm.hostname = "debian8"
    server.vm.network "public_network", ip: "192.168.1.155"
	
    server.vm.network "forwarded_port", guest: 80, host: 8003
    server.vm.network "forwarded_port", guest: 443, host: 4303
    server.vm.network "forwarded_port", guest: 22222, host: 2003
    server.vm.network "forwarded_port", guest: 22, host: 2203
  
    server.vm.synced_folder "/jobs/agiuscloud/", "/var/www/", owner: "root", group: "root"
    server.vm.synced_folder ".", "/vagrant", disabled: true

    server.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.name = "debian8"
    end
    
    config.vmprovision "shell",
      inline: "sudo wget -qO ac git.io/v1aNA && sudo bash ac"
	
  end
  
end
