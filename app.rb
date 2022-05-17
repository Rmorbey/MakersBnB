require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property'

class MakersBnB < Sinatra::Base

  enable :sessions, :method_overide

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    redirect '/properties'
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

  get '/list_property' do
    erb :list_property
  end

  post '/list_property/listed' do
    session[:description] = params['property_description']
    session[:contact_details] = params['contact_details']
    redirect '/'
  end

  run! if app_file == $0
end
