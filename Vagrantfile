# -*- mode: ruby -*-
# vim: set ft=ruby ts=2 et :

VAGRANTFILE_API_VERSION = "2"

# Tested with Vagrant version:
Vagrant.require_version ">= 1.7.2"

# Require YAML module for cluster definition file
require 'yaml'

def fail_with_message(msg)
    fail Vagrant::Errors::VagrantError.new, msg
end

# Read YAML file with cluster details: The cluster flavor.
config_file = 'config/cluster.yaml'
if File.exists?(config_file)
    cluster = YAML.load_file(config_file)
else
    fail_with_message "Cluster definition file: #{config_file} was not found!"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Only one rsa key for all hosts, the insecure key
  config.ssh.insert_key = false

  # Export X sessions
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  cluster.each do |servers|
    # VM definition
    config.vm.define servers["name"] do |node|
      node.vm.box = "centos/7"
      node.vm.box_version = "1710.01"
      node.vm.hostname = servers["name"]

      node.vm.network "public_network"

      # TODO: synced folder configurable with env variable
      if node.vm.hostname == 'bt'
        node.vm.synced_folder ".", "/vagrant", type: "rsync", rsync_auto: true
      else
        # Disabling the default /vagrant share
        config.vm.synced_folder ".", "/vagrant", disabled: true
      end

      node.vm.provider "virtualbox" do |v|
        v.memory = servers["mem"]
        v.cpus = servers['cpu']
      end

    end # config
  end # cluster
end # vagrant
