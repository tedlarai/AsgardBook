class FriendshipsController < ApplicationController
  def create
    friendship_request = FriendshipRequest.find(params[:friendship_request])
    @friendship = current_user.accepted_friendships.build(
      friendship_starter_id: friendship_request.sender_id)
    if @friendship.save
      friendship_request.destroy
      redirect_to :back
    else
      #some error message
      redirect_to :back
    end
  end

  def destroy
    Friendship.find_by(id: params[:id]).destroy
    redirect_to :back
  end
end
