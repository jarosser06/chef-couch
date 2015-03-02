couch_service 'default' do
  action [:create, :start]
  from_source true
end

couch_config 'test_config' do
  action :create
  source 'test_config.erb'
  notifies :restart, 'couch_service[default]', :delayed
end
