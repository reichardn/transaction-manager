class DealsController < ApplicationController

  get '/deals' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :'deals/deals'
    else
      redirect '/login'
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