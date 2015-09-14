# require_relative 'friendship_validator'

class Friendship < ActiveRecord::Base
  validates :friendship_starter, presence: true
  validates :friendship_accepter, presence: true
  include ActiveModel::Validations
  validates_with FriendshipBidirectionalUniqueness

  belongs_to :friendship_starter, class_name: 'User'
  belongs_to :friendship_accepter, class_name: 'User'
end
