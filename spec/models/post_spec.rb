require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    expect(build(:post)).to be_valid
  end

  let(:post) { build(:post) }

  describe 'Validations:' do
    it { expect(post).to validate_presence_of(:author) }
    it { expect(post).to validate_presence_of(:text) }
    it { expect(post).to validate_length_of(:text).is_at_most(1000) }
  end

  describe 'Associations:' do
    it { expect(post).to belong_to(:author).class_name('User') }
    it { expect(post).to have_many(:likes) }
    it { expect(post).to have_many(:likers).class_name('User') }
    it { expect(post).to have_many(:comments) }
  end
end
