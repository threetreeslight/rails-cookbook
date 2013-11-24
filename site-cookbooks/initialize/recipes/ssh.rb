#
# Cookbook Name:: initialize
# Recipe:: ssh
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service "sshd" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
  mode 0600
  notifies :restart, 'service[sshd]'
end

