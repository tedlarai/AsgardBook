require 'rails_helper'

RSpec.describe FriendshipRequest, type: :model do
  it 'has a valid factory' do
    expect(build(:friendship_request)).to be_valid
  end

  let(:request) { build(:friendship_request) }

  describe 'Validations: ' do
    it { expect(request).to validate_presence_of(:sender) }
    it { expect(request).to validate_presence_of(:receiver) }
    it 'has symetrical uniqueness' do
      request.save
      reverse_request = FactoryGirl.build(:friendship_request, sender: request.receiver, receiver: request.sender)
      repeated_request = FactoryGirl.build(:friendship_request, sender: request.sender, receiver: request.receiver)

      expect(reverse_request).to_not be_valid
      expect(repeated_request).to_not be_valid
    end
    it 'cannot allow self-request' do
      self_requester = create(:user)
      self_request = build(:friendship_request, sender: self_requester, receiver: self_requester)

      expect(self_request).to_not be_valid
    end
  end

  describe 'Associations: ' do
    it { expect(request).to belong_to(:sender).class_name('User') }
    it { expect(request).to belong_to(:receiver).class_name('User') }
  end
end
