class CommentsController < ApplicationController
  before_action :require_user, only: [:create, :vote]
  
  def create
    @comment = Comment.new
    @message = Message.find_by id: params[:message_id]
    @comment.body = params[:comment][:body]
    @comment.message = @message
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "Your comment has been created"
      redirect_to :back
    else
      render "messages/show"
    end
  end

  def vote
    @comment = Comment.find_by id: params[:id]
    @vote  = Vote.create(vote: params[:value], voteable: @comment, user_id: current_user.id) 
    
    respond_to do |format|
      format.js 
    end
  end
end
