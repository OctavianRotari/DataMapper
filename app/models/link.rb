require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
end

DataMapper.setup(:default, "https://fast-escarpment-9450.herokuapp.com/")
DataMapper.finalize
DataMapper.auto_upgrade!

# convention over configuration
