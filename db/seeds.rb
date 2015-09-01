# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do
  FactoryGirl.create :user
end

FactoryGirl.create :user, email: 'mail@mail.com', password: 'password'

(1..30).each do |x|
  case x % 5
  when 1
    Friendship.create(friendship_starter_id: 31, friendship_accepter_id: x)
  when 2
    Friendship.create(friendship_starter_id: x, friendship_accepter_id: 31)
  when 3
    FriendshipRequest.create(sender_id: 31, receiver_id: 31)
  when 4
    FriendshipRequest.create(sender_id: x, receiver_id: 31)
  end
end

100.times do
  user = User.all.sample
  user.posts.create(text: Faker::Hacker.say_something_smart)
end
