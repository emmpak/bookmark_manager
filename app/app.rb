require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManage < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end
end