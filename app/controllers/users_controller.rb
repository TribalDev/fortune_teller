class UsersController < ApplicationController
  before_action :require_user, only: [:vote]

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

  def vote
    @user = User.find_by id: params[:id]
    @vote  = Vote.create(vote: params[:value], voteable: @user, user_id: current_user.id) 
    
    binding.pry
    respond_to do |format|
      format.js 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
