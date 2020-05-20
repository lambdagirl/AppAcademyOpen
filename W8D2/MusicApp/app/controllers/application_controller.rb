class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_id, :logged_in?
  def current_user
    if session[:session_token]
      @current_user ||= User.find_by(session_token: session[:session_token])
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end
end
