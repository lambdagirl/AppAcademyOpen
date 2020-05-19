class UsersController < ApplicationControllergem

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Success!'
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_message
      render :new
    end
  end
end