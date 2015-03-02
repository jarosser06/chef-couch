require 'chef'

module Couch
  module Helpers
    def local_ini_file
      if new_resource.from_source
        local_ini_file = ::File.join(new_resource.path_prefix,
                                     'etc/couchdb/local.ini')
      end
      local_ini_file
    end

    def local_ini_dir(service_resource)
      if service_resource.from_source
        local_ini_dir = ::File.join(service_resource.path_prefix,
                                    'etc/couchdb/local.d')
      end
    end

    def dev_packages
      pkgs = %w( gcc )
      case node['platform_family']
      when 'debian'
        pkgs += %w( libicu-dev libcurl4-openssl-dev g++ )
        pkgs << value_for_platform(
          'debian' => { 'default' => 'libmozjs-dev' },
          'ubuntu' => {
            '10.04' => 'xulrunner-dev',
            '14.04' => 'libmozjs185-dev',
            'default' => 'libmozjs-dev'
          })
      when 'rhel', 'fedora'
        pkgs += %w(
          gcc-c++
          which
          make
          js-devel
          libtool
          libicu-devel
          openssl-devel
          curl-devel
        )
      else
        Chef::Log.warn('Using unsupported platform family')
      end

      pkgs
    end
  end
end
