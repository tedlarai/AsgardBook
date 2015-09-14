class FriendshipRequest < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :sender, presence: true
  validates :receiver, presence: true
  include ActiveModel::Validations
  validates_with FriendshipRequestBidirectionalUniqueness
end
