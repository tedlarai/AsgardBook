class TimelineController < ApplicationController
  def show
    @posts = current_user.timeline_content
  end
end
