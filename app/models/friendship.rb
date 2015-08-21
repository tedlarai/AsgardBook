class Friendship < ActiveRecord::Base
  belongs_to :friendship_starter, class_name: 'User'
  belongs_to :friendship_accepter, class_name: 'User'
end
