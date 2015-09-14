require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { create(:user) }

  # MY validations, not testing framework
  describe 'Validations: ' do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
    it { expect(user).to validate_length_of(:first_name).is_at_most(30) }
    it { expect(user).to validate_length_of(:last_name).is_at_most(30) }
  end

  describe 'Associations: ' do
    it { expect(user).to have_many(:started_friendships) }
    it { expect(user).to have_many(:accepted_friendships) }
    it { expect(user).to have_many(:starter_friends) }
    it { expect(user).to have_many(:accepter_friends) }
  end


  describe '#name' do
    it 'returns full name' do
      expect(user.name).to eq("#{user.first_name} #{user.last_name}")
    end
  end

  describe '#friends' do
    it 'returns all friends' do
      active_friend = create(:user)
      passive_friend = create(:user)
      accepted = FactoryGirl.create(:friendship, friendship_starter: active_friend, friendship_accepter: user)
      started = FactoryGirl.create(:friendship, friendship_starter: user, friendship_accepter: passive_friend)
      
      expect(user.friends).to include(passive_friend, active_friend)
    end
  end
end
