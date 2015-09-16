class FriendshipRequestsController < ApplicationController
  def create
    @request = current_user.sent_requests.build(friendship_request_params)
    if @request.save
      # success flash
    else
      # error flash
    end
    redirect_to user_path(User.find(params[:receiver_id]))
  end

  def destroy
    FriendshipRequest.find(params[:id]).destroy
    redirect_to :back
  end

  private
    def friendship_request_params
      params.permit(:receiver_id)
    end
end
