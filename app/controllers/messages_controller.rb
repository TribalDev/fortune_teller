class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def new
  end

  def create
    if @message = Message.create(message_params)
      flash[:message] = "Sweet!!! Your wisdom is recorded"
      redirect_to messages_path
    else
      render "index"
    end
  end

  def show
  end

  private
  def message_params
    params.require(:message).permit(:advice, :author)
  end
end
