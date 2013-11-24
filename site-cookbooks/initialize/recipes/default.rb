#
# Cookbook Name:: initialize
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group node[:initialize][:group] do
  group_name node[:initialize][:group]
  action     [:create]
end

user node[:initialize][:user] do
  comment  node[:initialize][:user]
  group    node[:initialize][:group]
  supports :manage_home => true
  action   [:create, :manage]
end

