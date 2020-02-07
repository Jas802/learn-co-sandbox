require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get "/" do
    erb :login
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect #needs redirect
    else
      redirect to #a different redirect
    end
  end
  
  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to #needs redirect
    else
      redirect to #needs redirect
    end
  end

end
