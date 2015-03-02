name              'couch'
maintainer        'Jim Rosser'
maintainer_email  'jarosser06@gmail.com'
license           'MIT'
description       'Installs and configures Couchdb'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'

%w(
  ubuntu
  redhat
  centos
  fedora
  scientific
  oracle
  amazon
  debian
).each do |os|
  supports os
end

depends 'yum-epel'
depends 'ark'
