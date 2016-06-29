class DealsController < ApplicationController

  get '/deals' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :'deals/deals'
    else
      redirect '/login'
    end
  end

  get '/deals/new' do 
    if Helpers.is_logged_in?(session)
      erb :'deals/create_deal'
    else
      redirect '/login'
    end
  end

  post '/deals/new' do 
    d = Deal.new(name: params[:name], user: Helpers.current_user(session))
    if d.save
       params[:tasks].each do |t|
        d.tasks << Task.create(description: t[:description], deal_id: d.id)
      end
      d.save
      redirect '/deals'
    else 
      redirect '/deals/new'
    end
  end

  get '/deals/:id' do 
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end

    @deal = Deal.find(params[:id])
    if  @deal.user_id == session[:user_id]
      erb :'deals/show_deal'
    else 
      redirect '/deals'
    end
  end

end