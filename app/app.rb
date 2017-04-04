require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManage < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  post '/links' do
    Link.create(url: params['Link'], title: params['Title'])
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/input')
  end


end
