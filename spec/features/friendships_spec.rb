require 'rails_helper'

RSpec.feature "Friendships", type: :feature do
  feature 'Send Friendship Request' do
    let(:requester_user) { create(:user) }
    let(:accepter_user) { create(:user) }


  end
end