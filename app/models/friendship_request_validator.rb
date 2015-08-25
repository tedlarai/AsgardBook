class  FriendshipRequestBidirectionalUniqueness < ActiveModel::Validator
  def validate(record)
    if record.sender.friendship_request_receivers.include?(record.receiver)
      record.errors[:receiver] << "You already sent a friendship request to this user"
    elsif record.sender.friendship_requesters.include?(record.receiver)
      record.errors[:receiver] << "You already received a friendship request from this user"
    end
  end
end
