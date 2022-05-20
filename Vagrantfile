ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

   config.vm.provision "shell", path: "initial script/bootstrap.sh"
   
    config.vm.define "jmaster" do |jmaster|
	  jmaster.vm.box = "centos/7"
    jmaster.vm.hostname = "jmaster.ops.raindrop.best"
    jmaster.vm.network "private_network", ip: "10.10.10.4"
  	jmaster.vm.provider "virtualbox" do |vb|
      vb.name = "jmaster"
      vb.memory = 512
      vb.cpus = 1
    end
  end
    config.vm.define "jworker" do |jworker|
    jworker.vm.box = "centos/7"
    jworker.vm.hostname = "jworker.ops.raindrop.best"
    jworker.vm.network "private_network", ip: "10.10.10.5"
	  jworker.vm.provider "virtualbox" do |vb|
      vb.name = "jworker"
      vb.memory = 1024
      vb.cpus = 1
    end
  end
    config.vm.define "grafana" do |grafana|
	  grafana.vm.box = "centos/7"
    grafana.vm.hostname = "grafana.ops.raindrop.best"
    grafana.vm.network "private_network", ip: "10.10.11.4"
	  grafana.vm.provider "virtualbox" do |vb|
      vb.name = "grafana"
      vb.memory = 512
      vb.cpus = 1
    end
  end
    config.vm.define "zabbix" do |zabbix|
    zabbix.vm.box = "centos/7"
    zabbix.vm.hostname = "zabbix.ops.raindrop.best"
    zabbix.vm.network "private_network", ip: "10.10.12.4"
	  zabbix.vm.provider "virtualbox" do |vb|
      vb.name = "zabbix"
      vb.memory = 1024
      vb.cpus = 1
    end
  end
  config.vm.define "jump" do |jump|
    jump.vm.box = "centos/7"
    jump.vm.hostname = "jump.ops.raindrop.best"
    jump.vm.network "private_network", ip: "10.10.13.4"
	  jump.vm.provider "virtualbox" do |vb|
      vb.name = "jump"
      vb.memory = 2048
      vb.cpus = 2
    end
  end
  config.vm.define "elk" do |elk|
    elk.vm.box = "centos/7"
    elk.vm.hostname = "elk.ops.raindrop.best"
    elk.vm.network "private_network", ip: "10.10.14.4"
	  elk.vm.provider "virtualbox" do |vb|
      vb.name = "elk"
      vb.memory = 512
      vb.cpus = 1
    end
  end
  config.vm.define "dock" do |dock|
    dock.vm.box = "centos/7"
    dock.vm.hostname = "dock.ops.raindrop.best"
    dock.vm.network "private_network", ip: "10.10.15.4"
	  dock.vm.provider "virtualbox" do |vb|
      vb.name = "dock"
      vb.memory = 1024
      vb.cpus = 2
    end
  end
end