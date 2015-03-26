package 'epel-release'

execute 'change epel repos https to http' do
  command 'sudo sed -i "s/mirrorlist=https/mirrorlist=http/" /etc/yum.repos.d/epel.repo'
  # only CentOS6.x
  only_if 'if cat /etc/redhat-release | grep -q "CentOS release 6"; then true; else false; fi'
end