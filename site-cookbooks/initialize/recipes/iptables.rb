#
# Cookbook Name:: initialize
# Recipe:: iptables
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "iptables"


service "iptables" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

template "/etc/sysconfig/iptables" do
  source "iptables.erb"
  mode 0644
  notifies :restart, 'service[iptables]'
end

