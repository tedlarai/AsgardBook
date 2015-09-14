require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'has a valid factory' do
    expect(build(:like)).to be_valid
  end

  let(:like) { build(:like) }

  describe 'Validations:' do
    it { expect(like).to validate_presence_of(:liker) }
    it { expect(like).to validate_presence_of(:post) }
  end

  describe 'Associations:' do
    it { expect(like).to belong_to(:liker).class_name('User') }
    it { expect(like).to belong_to(:post) }
  end
end
