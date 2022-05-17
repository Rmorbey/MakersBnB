require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pg'
require_relative './lib/property'
require_relative 'database_connection_setup'
require_relative './lib/user'

class MakersBnB < Sinatra::Base

  enable :sessions, :method_overide

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/properties'
  end

  get '/properties' do
    @user = User.find(id: session[:user_id])
    @properties = Property.view_all
    erb :'properties/index'
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  post '/properties' do
    Property.add(description: params[:description], contact: params[:contact], picture_url: params[:picture_url])
    redirect '/properties'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/properties'
  end
  
  get '/properties/:id' do
    params[:id] = Property.view_all.first.id
    erb :'properties/display'
  end

  post '/properties/:id/book' do
    Booking.create(params[:id], params[:start_date], params[:end_date])
    redirect '/properties/:id'
  end

  run! if app_file == $0

end
