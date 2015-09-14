require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'has a valid factory' do
    expect(build(:friendship)).to be_valid
  end

  let(:friendship) { build(:friendship) }

  describe 'Validations: ' do
    it { expect(friendship).to validate_presence_of(:friendship_starter) }
    it { expect(friendship).to validate_presence_of(:friendship_accepter) }

    it 'has symetrical uniqueness' do
      friendship.save
      reverse_friendship = FactoryGirl.build(
        :friendship,
        friendship_starter: friendship.friendship_accepter,
        friendship_accepter: friendship.friendship_starter
        )
      repeated_friendship = FactoryGirl.build(
        :friendship,
        friendship_starter: friendship.friendship_starter,
        friendship_accepter: friendship.friendship_accepter
        )

      expect(reverse_friendship).to_not be_valid
      expect(repeated_friendship).to_not be_valid
    end

    describe 'Associations:' do
      it { expect(friendship).to belong_to(:friendship_starter).class_name('User') }
      it { expect(friendship).to belong_to(:friendship_accepter).class_name('User') }
    end
  end

  describe 'Associations: ' do

  end
end
