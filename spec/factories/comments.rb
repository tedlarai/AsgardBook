FactoryGirl.define do
  factory :comment do
    author
    post
    text { Faker::Lorem.paragraphs(1) }
  end

end
