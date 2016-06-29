class TasksController < ApplicationController

  get 'tasks/new' do

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

  delete '/tasks/:id' do

  end

  post '/tasks/:id/change-status' do 
    @task = Task.find(params[:id])
    @task.update(complete: !@task.complete)
    redirect "tasks/#{@task.id}"
  end

end