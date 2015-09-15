module PostsHelper
  def user_liked_post?
    @post.likers.include?(current_user)
  end
end
