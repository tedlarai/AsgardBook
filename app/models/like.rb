class Like < ActiveRecord::Base
  belongs_to :liker, class_name: 'User'
  belongs_to :post

  validates :liker, presence: true
  validates :post, presence: true
end
