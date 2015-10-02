# chef_gem "aws-sdk" do
#   compile_time false
#   action :install
# end


git 'c:/inetpub/wwwroot/' do
  repository 'https://github.com/mungobungo/aws-test-iis-site.git'
  revision 'master'
  action :sync
end

