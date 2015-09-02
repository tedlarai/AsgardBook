class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      #success message
    else
      #error message
    end
    redirect_to :back
  end

  def destroy
    Like.find_by(like_params).destroy
    redirect_to :back
  end

  private

    def like_params
      params.require(:like).permit(:liker_id, :post_id)
    end
end
