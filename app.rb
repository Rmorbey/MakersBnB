require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    $house = session[:description]
    $contact = session[:contact_details]
    erb :index
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
