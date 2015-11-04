require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
end
_development _test bookmarkmanager_production
DataMapper.setup(:default, "bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

# convention over configuration
