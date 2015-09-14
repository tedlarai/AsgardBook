require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end

  let (:comment) { build(:comment) }

  describe 'Validations: ' do
    it { expect(comment).to validate_presence_of(:author) }
    it { expect(comment).to validate_presence_of(:post) }
    it { expect(comment).to validate_presence_of(:text) }
    it { expect(comment).to validate_length_of(:text).is_at_most(1000) }
  end

  describe 'Associations: ' do
    it { expect(comment).to belong_to(:author).class_name('User') }
    it { expect(comment).to belong_to(:post) }
  end
end
