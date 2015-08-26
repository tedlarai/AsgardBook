class NotificationsController < ApplicationController
  def show
    @requests = current_user.received_requests
  end
end
