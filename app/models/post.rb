class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes
  has_many :comments, dependent: :destroy
end
