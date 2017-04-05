ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManage < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  post '/links' do
    link = Link.new(url: params['Link'], title: params['Title'])
    tag = Tag.first_or_create(name: params['Tag'])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/input')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:'tags/bubbles')
  end


end
