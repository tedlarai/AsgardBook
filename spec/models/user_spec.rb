require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }
  let(:first_name) { user.first_name }
  let(:last_name) { user.last_name }

  # MY validations, not testing framework
  it { expect(user).to validate_presence_of(:first_name) }
  it { expect(user).to validate_presence_of(:last_name) }
  it { expect(user).to validate_length_of(:first_name).is_at_most(30) }
  it { expect(user).to validate_length_of(:last_name).is_at_most(30) }

  # associations
  it { expect(user).to have_many(:accepted_friendships) }

  describe '#name' do
    it 'returns full name' do
      expect(user.name).to eq("#{first_name} #{last_name}")
    end
  end
end
