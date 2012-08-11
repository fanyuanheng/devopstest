namespace :package do
  
  desc "package puppet"
  task :puppet do |task, args|
    mkdir_p "#{BUILD_DIR}"
    sh "cd puppet; tar -zcf ../#{BUILD_DIR}/puppet.tar.gz *"
  end
  
end
