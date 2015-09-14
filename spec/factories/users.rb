FactoryGirl.define do
  factory :user, aliases: [:author, :sender, :receiver, :friendship_starter, :friendship_accepter, :liker] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name}@#{last_name}.com".downcase }
    password "password"
    password_confirmation "password"
  end
end
