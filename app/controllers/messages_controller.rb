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
      flash[:message] = "Sweet!!! Your wisdom is recorded"
      redirect_to messages_path
    else
      flash[:error] = "Sorry something went wrong"
      render "new"
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:advice, :author)
  end
end
