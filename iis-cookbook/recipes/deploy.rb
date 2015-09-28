chef_gem "aws-sdk" do
  compile_time false
  action :install
end

chef_gem "git" do
  compile_time false
  action :install
end

ruby_block "download-object" do
  block do
#    require 'git'
#    URI = 'https://github.com/mungobungo/tutorial-opworks.git'
#    NAME = 'tutorial-opworks'
#    g = Git.clone(URI, NAME, :path => 'c:/temp')
    FileUtils.cp_r(Dir['c:\temp\tutorial-opworks\site\*'],'c:/inetpub/wwwroot/')
  end
  action :run
end
