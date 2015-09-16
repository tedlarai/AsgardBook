module FriendshipsHelper
  def find_friendship(user1, user2)
      Friendship.find_by(friendship_starter: user2, friendship_accepter: user1)\
      ||\
      Friendship.find_by(friendship_starter: user1, friendship_accepter: user2)
  end
end
