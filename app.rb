require 'sinatra/base'

class Link < Sinatra::Base

  run! if app_file == $0
end
