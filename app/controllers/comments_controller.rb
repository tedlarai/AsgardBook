class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
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
      params.require(:comment).permit(:author_id, :post_id, :text)
    end
end
