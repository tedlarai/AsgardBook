class LikesController < ApplicationController
  def create
    @like = Post.find(params[:post_id]).likes.build(liker: current_user)
    if @like.save
      #success message
    else
      #error message
    end
    redirect_to :back
  end

  def destroy
    Like.find_by(post: Post.find(params[:id]), liker: current_user).destroy
    redirect_to :back
  end
end
