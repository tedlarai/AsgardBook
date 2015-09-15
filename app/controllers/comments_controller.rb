class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      #success message
    else
      #failure message
    end
    redirect_to :back
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end
