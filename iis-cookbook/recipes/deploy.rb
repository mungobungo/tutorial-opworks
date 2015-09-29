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
   require 'git'
    URI = 'https://github.com/mungobungo/tutorial-opworks.git'
    NAME = 'tutorialop'
    g = Git.clone(URI, NAME, :path => 'c:/temp')
  end
  action :run
end

cookbook_file "c:/inetpub/wwwroot/default.htm" do
  source "c:/temp/tutorialop/site/default.htm"
end

