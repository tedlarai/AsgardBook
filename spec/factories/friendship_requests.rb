FactoryGirl.define do
  factory :friendship_request do
    friendship_request_sender "MyString"
references "MyString"
friendship_request_receiver nil
  end

end
