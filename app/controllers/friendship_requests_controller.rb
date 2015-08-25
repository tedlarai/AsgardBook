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
  end

  private
  # security problem? anyone can create a friendship_request via url
  # how use devise to solve this? create this controller as a devise controller? use just the token ?
    def friendship_request_params
      params.permit(:receiver_id)
    end
end
