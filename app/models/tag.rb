require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require_relative 'link'


class Tag
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :name, String
end
