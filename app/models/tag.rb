require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :link_id, Integer
end
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!