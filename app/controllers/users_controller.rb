class UsersController < ApplicationController
  def new
    @user = User.new
    @messages = Message.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Welcome"
      redirect_to messages_path
    else
      flash[:error] = "Error registering"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
