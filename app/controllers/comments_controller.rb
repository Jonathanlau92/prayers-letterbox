class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @comment = Comment.new(comment_params)
        @comment.is_deleted = false
       
        if @comment.save!
          head :ok
        else
          head :internal_server_error
        end
    end

    private
    def comment_params
      params.require(:comment).permit(:content, :prayer_id, :user_id)
    end
end