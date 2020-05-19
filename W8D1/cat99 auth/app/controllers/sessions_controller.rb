class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user.nil?
      render json: 'Credentials were wrong'
    else
      login!(user)
      redirect_to user_url(user)
    end
  end

  def new
    #Render a form for the user to input their username and password.
  end

  def destory
    logout!
    redirect_to new_session_url
  end
end