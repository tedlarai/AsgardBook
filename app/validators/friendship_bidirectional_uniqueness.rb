class  FriendshipBidirectionalUniqueness < ActiveModel::Validator
  def validate(record)
    if record.friendship_starter && record.friendship_accepter && \
        record.friendship_starter.is_friends_with?(record.friendship_accepter)
      record.errors[:friendship_accepter] << \
      "You are already friends with #{record.friendship_accepter.name}"
    end
  end
end
