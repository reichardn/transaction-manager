class Helpers

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

  def self.validate_task(task, session)
    self.current_user(session).tasks.include?(task)
  end

end