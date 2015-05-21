class MessagesController < ApplicationController
  before_action :require_user, only: [:new, :create]
  
  def index
    @messages = Message.all
  end

  def new
    @message  = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.author = current_user.name

    if @message.save
      flash[:notice] = "Message Saved, Advice will be taken"
      redirect_to messages_path
    else
      flash[:error] = "Sorry, something went wrong"
      render :new
    end
  end

  def show
    @messages = Message.all
    @message  = Message.find(params[:id])
    render :index
  end

  private
  def message_params
    params.require(:message).permit(:advice)
  end
end
