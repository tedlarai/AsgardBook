class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to home_path
    else
      render new_post_path
    end
  end

  def post_params
    params.require(:post).permit(:text)
  end
end
