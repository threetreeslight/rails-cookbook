#
# Cookbook Name:: initialize
# Recipe:: users
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:initialize][:users].each do |usr|
  group usr do
    group_name usr
    action     [:create]
  end

  user usr do
    comment  usr
    group    usr
    supports :manage_home => true
    action   [:create, :manage]
  end

  directory "/home/#{usr}/.ssh" do
    owner usr
    group usr
    mode 0700
    action :create
  end

  template "/home/#{usr}/.ssh/authorized_keys" do
    source "authorized_keys.erb"
    owner usr
    group usr
    mode 0644
  end
end

