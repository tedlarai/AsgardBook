class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Friendship associations
  has_many :started_friendships, foreign_key: :friendship_starter_id, class_name: 'Friendship', dependent: :destroy
  has_many :accepted_friendships, foreign_key: :friendship_accepter_id, class_name: 'Friendship', dependent: :destroy
  has_many :starter_friends, through: :accepted_friendships, source: :friendship_starter
  has_many :accepter_friends, through: :started_friendships, source: :friendship_accepter
  # Friendship Request associations
  has_many :sent_requests, foreign_key: :sender_id, class_name: 'FriendshipRequest', dependent: :destroy
  has_many :received_requests, foreign_key: :receiver_id, class_name: 'FriendshipRequest', dependent: :destroy
  has_many :friendship_request_receivers, through: :sent_requests, source: :receiver
  has_many :friendship_requesters, through: :received_requests, source: :sender
  # Posts associations
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :liker_id, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :posts
  # Comments associations
  has_many :comments, foreign_key: :author_id, dependent: :destroy

  # Validations
  validates :first_name, :last_name, presence: true,
                                     length: { maximum: 30 }



 def friends
   (starter_friends.reload + accepter_friends.reload).sort {|friend_a, friend_b| friend_a.name <=> friend_b.name}
 end

 def is_friends_with?(other_user)
   self.friends.include?(other_user)
 end

 def timeline_content
   content = self.posts.all
   friends.each do |friend|
     content += friend.posts.all
   end
   content.sort_by(&:updated_at).reverse
 end

  def name
    "#{first_name} #{last_name}"
  end
end
