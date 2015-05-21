class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by name: params[:name]
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome man"
      session[:id] = user.id
      redirect_to messages_path
    else
      flash[:error] = "Error please try again"
      render :new
    end
  end

  def destroy
    session[:id] = nil
    flash[:success] = "Goodbye"

    redirect_to root_path
  end
end
