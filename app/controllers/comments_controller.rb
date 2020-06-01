class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.is_deleted = false
   
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @comment.prayer, notice: 'Comment was successfully created.' }
        format.js   { }
        format.json { render :show, status: :created, location: @comment }
      else
        head :internal_server_error
      end
    end
  end
  
  def show
  end
  private
  def comment_params
    params.require(:comment).permit(:content, :prayer_id, :user_id)
  end
end