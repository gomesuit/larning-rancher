# -*- mode: ruby -*-
# vi: set ft=ruby :

NODE_COUNT = 2

Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-16.04'

  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 1
    vb.memory = 1024
    # vb.customize ['modifyvm', :id, '--natnet1', '172.16.1.0/24']
  end

  config.vm.provision 'shell', path: 'install-docker.sh'

  config.vm.define :master do |host|
    host.vm.hostname = 'master'
    host.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--natnet1', '172.16.1.0/24']
    end
    host.vm.network :private_network, ip: '192.168.33.10'
    host.vm.provision 'shell', inline: <<-SHELL
      docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/server:preview
    SHELL
  end

  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.hostname = "node#{i}"
      subconfig.vm.provider 'virtualbox' do |vb|
        vb.customize ['modifyvm', :id, '--natnet1', "172.16.1#{i}.0/24"]
      end
      subconfig.vm.network :private_network, ip: "192.168.33.1#{i}"
    end
  end
end
