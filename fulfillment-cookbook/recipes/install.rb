
powershell_script 'Install choco'
  code "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
end
powershell_script 'Install git'
  code "choco install -y  git"
end

powershell_script 'Install chef development kit'
  code "choco install -y chefdk"
end


chef_gem "git" do
  compile_time false
  action :install
end

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

iis_site 'Default Web Site' do
	action [:stop, :delete]
end

iis_site "#{cookbook_name}" do
	action [:stop, :delete]
end

iis_app "#{cookbook_name}" do
	action [:delete]
end

#Recycle the appPool:
iis_pool "#{cookbook_name}" do
    action [:stop, :delete]
end


#Create an appPool:
iis_pool "#{cookbook_name}" do
    runtime_version "4.0"
    pipeline_mode :Integrated
    # pool_username "domain\\username"
	 #pool_password "password"
 	action [:add,:config]
end


#Create a website:
iis_site "#{cookbook_name}" do
	path 'C:\projects\vagrant\aws-test-iis-site'
	site_name "#{cookbook_name}"
	application_pool "#{cookbook_name}"
	action [:add,:start]
end

# creates a new app
iis_app "#{cookbook_name}" do
  path "/FulfillmentService"
  application_pool "#{cookbook_name}"
  physical_path 'C:\projects\test_Fulfillment\FulfillmentService'
  enabled_protocols "http,net.pipe"
  action :add
end

# creates a new app
iis_app "#{cookbook_name}" do
  Chef::Log.debug('string')
  path "/FulfillmentService2"
  application_pool "#{cookbook_name}"
  physical_path 'C:\projects\test_Fulfillment\FulfillmentService'
  enabled_protocols "http,net.pipe"
  action :add
end

# creates a new app
iis_app "#{cookbook_name}" do
  path "/FulfillmentService3"
  application_pool "#{cookbook_name}"
  physical_path 'C:\projects\test_Fulfillment\FulfillmentManagement'
  enabled_protocols "http,net.pipe"
  action :add
end

#Configure the bindings:
iis_site "#{cookbook_name}" do
	bindings "http/*:80:localhost"
	action [:config,:restart]
end


# service 'w3svc' do
#   action [:start, :enable]
# end
