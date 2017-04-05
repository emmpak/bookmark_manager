ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManage < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect to('/links')
  end

  get '/links' do
    @user = User.all.last
    @links = Link.all
    erb(:'links/index')
  end

  post '/links' do
    link = Link.new(url: params['Link'], title: params['Title'])
    tags = params["Tag"].gsub(/\s/, "").split(',')
    tags.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/input')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:'tags/index')
  end


end
