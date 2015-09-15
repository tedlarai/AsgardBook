class  SelfFriendshipProhibition < ActiveModel::Validator
  def validate(record)
    if record.friendship_starter == record.friendship_accepter
      record.errors[:friendship_accepter] << \
        "User cannot befriend him/herself"
    end
  end
end
