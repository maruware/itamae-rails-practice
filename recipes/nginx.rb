package 'nginx'

template "/etc/nginx/nginx.conf" do
  source 'templates/nginx.conf.erb'
end

service "nginx" do
  action [:enable, :restart]
end