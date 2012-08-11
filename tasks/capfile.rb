raise "DEPLOY_USER not set!" unless ENV.has_key? "DEPLOY_USER"
raise "DEPLOY_HOSTS not set!" unless ENV.has_key? "DEPLOY_HOSTS"
raise "DEPLOY_KEY not set!" unless ENV.has_key? "DEPLOY_KEY"

ENV["HOSTS"] =  ENV["DEPLOY_HOSTS"]
set :user, ENV["DEPLOY_USER"]
ssh_options[:keys] = ENV["DEPLOY_KEY"]

task :install_puppet do
  run("#{sudo} yum install -y puppet")
end

task :puppet_apply do
  do_noop = ""
  do_noop << "--noop" unless noop.empty?
  work_dir = "/tmp/puppet-apply-#{Time.now.to_i}"
  run("mkdir -p #{work_dir}")
  put(File.read("build/puppet.tar.gz"), "#{work_dir}/puppet.tar.gz")
  run("cd #{work_dir}; tar zxf puppet.tar.gz")
  run("cd #{work_dir}; #{sudo} FACTER_WORK_DIR=#{work_dir} puppet apply --color=true #{do_noop} --modulepath=modules site.pp")
  run("rm -rf #{work_dir}")
end