class ApplicationController < ActionController::Base

  def current_user
    if session[:session_token]
      return @current_user ||= User.find_by(session_token: session[:session_token])
    else 
      return nil 
    end
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def require_login!
    redirect_to new_session_url if current_user.nil?
  end
end
