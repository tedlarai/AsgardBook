class Comment < ActiveRecord::Base
  # to test an association, and not only the foreign key, the name of the
  # must be used: 'author' and not 'author_id'
  validates :author, presence: true
  validates :post, presence: true
  validates :text, presence: true,
                   length: { maximum: 1000 }


  belongs_to :author, class_name: 'User'
  belongs_to :post
end
