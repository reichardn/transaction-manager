require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    if Helpers.is_logged_in?(session)
      redirect '/deals'
    else
      redirect '/login'
    end
  end

   get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/deals'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(name: params[:user], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/deals'
    else
      redirect '/signup' 
    end
  end

  get "/logout" do
    session.clear if Helpers.is_logged_in?(session)
    redirect "/login"
  end

  get '/login' do 
    if Helpers.is_logged_in?(session)
      redirect '/deals'
    else
      erb :'users/login'
    end
  end 

  post "/login" do
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/deals"
    else
        redirect "/failure"
    end
  end

end