require "vagrant"

namespace :environment do
  
  desc "Setup vagrant environment e.g DEPLOY_USER, DEPLOY_KEY and DEPLOY_HOSTS"
  task :vagrant do |task, args|
    vagrant = Vagrant::Environment.new(:cwd => args[:vagrant_env])
    hosts = []
    key = ""
    vagrant.vms.each do |name, vm|
      if vm.state == :running
        ssh = Vagrant::SSH.new(vm)
        key = ssh.info[:private_key_path]
        hosts << "#{ssh.info[:host]}:#{ssh.info[:port]}"
      end
    end
    ENV["DEPLOY_USER"] = "vagrant"
    ENV["DEPLOY_KEY"] = key
    ENV["DEPLOY_HOSTS"] = hosts.join(",")
  end

end