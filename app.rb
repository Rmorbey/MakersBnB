require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pg'
require_relative './lib/property'
require_relative 'database_connection_setup'

class MakersBnB < Sinatra::Base

  enable :sessions, :method_overide

  configure :development do
    register Sinatra::Reloader
  end

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
    Property.add(description: params[:description], contact: params[:contact], picture_url: params[:picture_url])
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
