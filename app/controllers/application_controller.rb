require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :'/forms/homepage'
  end

  get '/signup' do
    erb :'/forms/signup'
  end

  post '/signup' do

  end

  helpers do
    private

    def current_user
      User.find_by(id: session[:id])
    end

    def is_logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !is_logged_in?
        redirect '/'
      end
    end
  end

end
