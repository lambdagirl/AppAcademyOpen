class UsersController < ApplicationController

  def create
    @user = User.new(user_params)


    if  @user.save
      UserMailer.welcome_email(@user).deliver_now!
      flash[:notice] = "successfully created your account! Check your inbox for an activation email"
      redirect_to new_session_url 

      # log_in_user!(@user)
      # redirect_to user_url(@user)
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    @user.activate!
    log_in_user!(@user)
    flash[:notice] ="successfully actived your account!"
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end



end