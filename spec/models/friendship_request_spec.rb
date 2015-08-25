require 'rails_helper'

RSpec.describe FriendshipRequest, type: :model do
  let(:sender) { create(:user) }
  let(:receiver) { create(:user)}
  let(:request) { FriendshipRequest.create(sender_id: sender.id, receiver_id: receiver.id) }
  let(:reverse_request) { FriendshipRequest.create(sender_id: request.receiver.id, receiver_id: request.sender.id) }
  let(:repeated_request) { FriendshipRequest.create(sender_id: request.sender.id, receiver_id: request.receiver.id) }

  it 'has symetrical uniqueness' do
    expect(reverse_request).to_not be_valid
    expect(repeated_request).to_not be_valid
  end
end
