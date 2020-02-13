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
  
  helpers do
    def if_not_logged_in
      if !logged_in?
        redirect "/login?error=Sorry,you need to login first."
      end
    end
  
   def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

end
