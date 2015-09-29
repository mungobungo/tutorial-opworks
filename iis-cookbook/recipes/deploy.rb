chef_gem "aws-sdk" do
  compile_time false
  action :install
end

chef_gem "git" do
  compile_time false
  action :install
end

cookbook_file "c:/inetpub/wwwroot/default.htm" do
  source "default.htm"
  action :create
end

