
powershell_script 'Install choco'
  code "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
end
powershell_script 'Install git'
  code "choco install -y  git"
end

powershell_script 'Install chef development kit'
  code "choco install -y chefdk"
end

powershell_script 'Install chef development kit'
  code "choco install -y vim"
end
# after this one 'berks is in the path'

git 'c:/chef/fulfillment-cookbook' do
  repository 'https://github.com/mungobungo/tutorial-opworks.git'
  revision 'master'
  action :sync
end

powershell_script 'Install chef development kit'
  cwd "c:/chef/fulfillment-cookbook"
  code "berks install"
end

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

