FactoryGirl.define do
  factory :post do
    author
    text { Faker::Hacker.say_something_smart }
  end

end
