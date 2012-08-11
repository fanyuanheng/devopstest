require "capistrano"
require "capistrano/cli"
require "capistrano/configuration/variables"

namespace :node do
  
  desc "bootstraps the node(s) configured in DEPLOY_HOSTS"
  task :bootstrap do |task, args|
    cap :install_puppet
  end
  
  desc "runs puppet apply on the node(s) configured in DEPLOY_HOSTS"
  task :puppet_apply, :noop do |task, args|
    cap :puppet_apply, :noop => args[:noop]
  end
  
  def cap(task, *args)
    parameters = ["-f", "#{File.dirname(__FILE__)}/capfile.rb"]
    
    redirect_logs(parameters) if ENV['USE_CAPLOGFILE'] == "true"

    parameters << task
    unless args.empty?
      parameters = parameters.concat(args.first.map { |key, value| ["-s", "#{key}=#{value}"] }.flatten)
    end
    Capistrano::CLI.parse(parameters).execute!
  end
  
end