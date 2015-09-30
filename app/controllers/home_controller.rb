class HomeController < ApplicationController
  # dont have a show action, but still works implicitly!!
  # not anymore, but I will keep the comment
  def show
    @posts = current_user.posts.ordered.all
  end
end
