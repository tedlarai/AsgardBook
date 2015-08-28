class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.accepted_friendships.build(friendship_starter_id: params[:requester])
    if @friendship.save
      redirect_to params[:return_to]
    else
      #some error message
      render params[:return_to]
    end
  end

  def destroy
  end
end
