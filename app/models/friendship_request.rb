require_relative 'friendship_request_validator.rb'
class FriendshipRequest < ActiveRecord::Base
  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  include ActiveModel::Validations
  validates_with FriendshipRequestBidirectionalUniqueness

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
