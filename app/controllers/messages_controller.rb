class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end

  def new
    @message  = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      @messages = Message.all
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
    params.require(:message).permit(:advice, :author)
  end
end
