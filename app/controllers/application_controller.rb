class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:id]) if session[:id]
  end

  def require_user
    if !current_user
      flash[:error] = "Must be logged in"
      redirect_to root_path
    end
  end
end
