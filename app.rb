require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'properties/index'
  end

  get '/properties' do
    @properties = Property.view_all
    erb :'properties/index'
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  post '/properties' do
    Property.add(description: params[:description], contact: params[:contact])
    redirect '/properties'
  end

  run! if app_file == $0
end
