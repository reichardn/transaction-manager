class TasksController < ApplicationController

  get '/deals/:id/new-task' do 
    @deal = Deal.find(params[:id])
    if @deal && @deal.user_id == session[:user_id] && Helpers.is_logged_in?(session) 
      erb :'tasks/create_task'
    else
      redirect '/login'
    end
  end

  post '/deals/:id/new-task' do 
    t = Task.new(description: params[:description], deal_id: params[:id])
    if t.save
      redirect "deals/#{t.deal_id}"
    else 
      redirect "deals/#{Helpers.current_user(session).id}/new-task"
    end
  end

  get '/tasks/:id' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end

    @task = Task.find(params[:id])
    if Helpers.validate_task(@task, session)
      erb :'tasks/show_task'
    else 
      redirect '/deals'
    end
  end  

  get '/tasks/:id/edit' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end

    @task = Task.find(params[:id])
    if Helpers.validate_task(@task, session)
      erb :'tasks/edit_task'
    else 
      redirect '/deals'
    end
  end

  post '/tasks/:id' do
    @task = Task.find(params[:id])
    if @task.update(description: params[:description])
      redirect "/deals/#{@task.deal_id}"
    else
      redirect "deals/#{params[:id]}/edit" 
    end
  end

  delete '/tasks/:id' do
    # TO DO -------------
  end

  post '/tasks/:id/change-status' do 
    @task = Task.find(params[:id])
    @task.update(complete: !@task.complete)
    redirect "tasks/#{@task.id}"
  end

end