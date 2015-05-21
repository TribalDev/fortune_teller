class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @messages = Message.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:id] = @user.id
      flash[:notice] = "Welcome"
      redirect_to messages_path
    else
      flash[:error] = "Error registering"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
