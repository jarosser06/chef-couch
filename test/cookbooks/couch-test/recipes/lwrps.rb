couch_service 'default' do
  action [:create, :start]
  from_source true
end

couch_database 'mydb' do
  action :create
end

couch_database 'myotherdb' do
  action :delete
end

couch_replication 'mydb' do
  target 'mydb2'
  continuous true
end
