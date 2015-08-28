class NotificationsController < ApplicationController
  def show
    @friendship_requests = current_user.received_requests
  end
end
