require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pg'
require_relative './lib/property'
require_relative 'database_connection_setup'
require_relative './lib/user'
require_relative './lib/booking'

class MakersBnB < Sinatra::Base

  enable :sessions, :method_overide
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/sessions/new'
  end

  get '/properties' do
    @user_id = session[:user_id]
    @user = User.find(id: session[:user_id])
    @properties = Property.view_all
    erb :'properties/index'
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  post '/properties' do

    user = User.find(id: session[:user_id])
    Property.add(description: params[:description], contact: user.email, picture_url: params[:picture_url], price_per_night: params[:price_per_night], user_id: session[:user_id])

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
    @id = params[:id]
    @property = Property.find_by_property_id(id: @id)
    @bookings = Booking.confirmed_property_id(id: @id)
    erb :'properties/display'
  end

  post '/properties/:id/book' do
    @id = params[:id]
    Booking.create(property_id: params[:id], user_id: session[:user_id], start_date: params[:start_date], end_date: params[:end_date])
    flash[:notice] = "Property successfully booked!!!!!!!!!!!!!! :D:D:D:D:D"
    redirect "/properties/#{@id}"
  end

  get '/bookings/:id' do
    @properties = Property.find_by_user(id: params[:id])
    @requests = Booking.find_requests_by_user_id(id: params[:id])
    @id = params[:id]
    erb :'bookings/my_listings'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

 
  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id 
      redirect '/properties'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/sessions/new'
  end

  get '/team' do
    erb :'team/members'
  end

  run! if app_file == $0

end
