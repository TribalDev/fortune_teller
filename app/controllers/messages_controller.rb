class MessagesController < ApplicationController
  before_action :require_user, only: [:new, :create, :vote]
  
  def index
    @messages = Message.vote_sort
  end

  def new
    @message  = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.creator = current_user
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
    @message  = Message.find(params[:id])
    @comment  = Comment.new
  end

  def vote
    @message = Message.find_by id: params[:id]
    @vote  = Vote.create(vote: params[:value], voteable: @message, user_id: current_user.id) 
    
    respond_to do |format|
      format.js 
    end
  end

  private

  def message_params
    params.require(:message).permit(:advice)
  end
end
