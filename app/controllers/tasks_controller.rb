class TasksController < ApplicationController

  get 'tasks/:id' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end

    @task = Task.find(params[:id])
    if  @task.user_id == session[:user_id]
      erb :'tasks/show_task'
    else 
      redirect '/deals'
    end
  end  

end