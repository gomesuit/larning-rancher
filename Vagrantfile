# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-16.04'
  config.vm.network 'private_network', ip: '192.168.33.10'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '4096'
  end

  config.vm.provision 'shell', path: 'install-docker.sh'
  config.vm.provision 'shell', inline: <<-SHELL
    docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/server:preview
  SHELL
end
