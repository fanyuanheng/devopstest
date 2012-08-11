Vagrant::Config.run do |config|
  config.vm.box = 'centos58_x86_64'
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = 'http://dl.dropbox.com/u/81233116/centos58_64.box'
  # CentOS takes a while to boot so we need to wait a whole lot longer
  config.ssh.max_tries = 50
  config.ssh.timeout = 300

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "vagrant-share", "/vagrant-share", "share"
  config.vm.forward_port 8080, 9080, :auto => true
  config.vm.forward_port 443, 9443, :auto => true

  config.vm.host_name = "devops.vagrant.test"
  config.vm.customize ['modifyvm', :id, '--memory', '512']
end
