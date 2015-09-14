class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes
  has_many :comments, dependent: :destroy

  validates :author, presence: true
  validates :text, presence: true,
                   length: { maximum: 1000 }
end
