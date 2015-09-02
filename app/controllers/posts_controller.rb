class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @likers = @post.likers
    @liked = @likers.include?(current_user)
  end

  def destroy
    to_del_post = Post.find(params[:id])
    if current_user == to_del_post.author
      to_del_post.destroy
    end
    redirect_to timeline_path
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
