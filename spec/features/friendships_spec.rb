require 'rails_helper'

RSpec.feature "Friendships", type: :feature do
  feature 'Send Friendship Request' do
    let(:requester_user) { create(:user) }
    let(:accepter_user) { create(:user) }

    context 'When not friends' do
      before do
        successful_login requester_user
        visit user_path(accepter_user)
      end

      it 'can see a link to send friends request' do
        expect(page).to have_content('Send friendship request')
      end

      it 'can make a request' do
        click_on 'Send friendship request'
        expect(page.has_content?('Send friendship request')).to be false
        expect(page.has_content?('Friendship awaiting approval')).to be true       
      end
    end
  end
end
