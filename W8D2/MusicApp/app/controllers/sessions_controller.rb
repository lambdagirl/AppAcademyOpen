class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(email:params[:user][:email]).try(
      :authenticate, params[:user][:password])
    if user.nil?
      flash.now[:errors] =['invalid credentials']
      render :new
    else
      redirect_to user_url(user)
    end
  end


  def destroy
    logout!
    redirect_to new_session_url
  end


end