# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.


  config.vm.box = "hashicorp/precise64"

  config.ssh.forward_x11 = true
  config.ssh.forward_agent = true

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

   config.vm.provision "shell", inline: <<-SHELL
   
      apt-get update
      apt-get install -y apache2

      #Install Vim for CLI Text Editor
      sudo apt-get install -y vim

      # Install Java 8
      apt-get install -y python-software-properties
      add-apt-repository ppa:webupd8team/java
      apt-get -y -q update
      echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
      apt-get -y install oracle-java8-installer
      update-java-alternatives -s java-8-oracle

      # Find java home location ( should be /usr/lib/jvm/java-8-oracle/jre/ )
      readlink -f /usr/bin/java | sed "s:bin/java::"

      # Set JAVA_HOME Variable
      echo '\n\n JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/"' >> /etc/environment
      source /etc/environment

      # Install Hadoop
      wget http://ftp.heanet.ie/mirrors/www.apache.org/dist/hadoop/common/stable/hadoop-2.9.0.tar.gz
      tar xzf hadoop-2.9.0.tar.gz
      mv hadoop-2.9.0 /usr/local/hadoop
      chmod -R 777 /usr/local/hadoop

      # Set JAVA_HOME Variable in Hadoop
      echo '\n\n export JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/"' >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh

      ### For multi node cluster - so nodes can communicate via ssh
      ### Need to add key to each nodes authorized_keys file
      # Setup passphraseless ssh for localhost 
      # ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
      # cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
      # chmod 0600 ~/.ssh/authorized_keys

      #Install Pig
      wget http://ftp.heanet.ie/mirrors/www.apache.org/dist/pig/pig-0.17.0/pig-0.17.0.tar.gz
      tar -xvf pig-0.17.0.tar.gz

      # Move Pig 
      mkdir /usr/lib/pig
      mv pig-0.17.0 /usr/lib/pig/

      #Install HIVE
      wget http://ftp.heanet.ie/mirrors/www.apache.org/dist/hive/stable-2/apache-hive-2.3.2-bin.tar.gz 
      tar -xvf apache-hive-2.3.2-bin.tar.gz

      # Move HIVE
      mkdir /usr/lib/hive
      mv apache-hive-2.3.2-bin /usr/lib/hive/

      ### RUN THESE COMMANDS AFTER VM BOOTS UP (vagrant up)

      # # Add PIG_HOME to PATH
      # echo 'export PIG_HOME=/usr/lib/pig/pig-0.17.0' >> ~/.bashrc
      # echo 'export PATH=$PATH:$PIG_HOME/bin' >> ~/.bashrc

      # # Add HIVE_HOME to PATH
      # echo 'export HIVE_HOME=/usr/lib/hive/apache-hive-2.3.2-bin' >> ~/.bashrc
      # echo 'export PATH=$PATH:$HIVE_HOME/bin' >> ~/.bashrc

      # # Add HADOOP_HOME Environmental variable for HIVE to work (ALTERNATIVE:/usr/local/hive/bin/hive-config.sh)
      # echo 'export HADOOP_HOME=/usr/local/hadoop' >> ~/.bashrc

   SHELL

  # Copy files over to virtual filesystem 
  config.vm.provision "file", source: "/Users/admin/workspace/CA675/SEdata05-1491.csv", destination: "SEdata05-1491.csv"
  config.vm.provision "file", source: "/Users/admin/workspace/CA675/SEdata04-49820.csv", destination: "SEdata04-49820.csv"
  config.vm.provision "file", source: "/Users/admin/workspace/CA675/SEdata03-49436.csv", destination: "SEdata03-49436.csv"
  config.vm.provision "file", source: "/Users/admin/workspace/CA675/SEdata02-49366.csv", destination: "SEdata02-49366.csv"
  config.vm.provision "file", source: "/Users/admin/workspace/CA675/SEdata01-49950.csv", destination: "SEdata01-49950.csv"

end
