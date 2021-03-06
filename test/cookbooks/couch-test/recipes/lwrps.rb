couch_service 'default' do
  action [:create, :start]
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

sample_doc = {
  'first_name' => 'Stirling',
  'last_name' => 'Archer',
  'occupation' => 'Spy'
}

couch_query 'add_document' do
  urn '/mydb/'
  body sample_doc
  response_code '201'
end
