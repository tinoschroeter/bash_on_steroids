#                                                                                                     
# Cookbook Name:: cookbook-bos
# Recipe:: default
#
# Copyright 2019, BOS
#
# All rights reserved - Do Not Redistribute
#
package "git" 

git '/var/www/html/' do
  repository 'git@github.com:tinoschroeter/bash_on_steroids.git'
  revision 'master'
  action :sync
end

bash 'execute_bos' do
  user 'root'
  cwd '/var/www/html/script'
  code <<-EOH
  ./build.sh
  EOH
end
