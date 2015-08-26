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

  feature 'Deal with received requests' do
    let(:requester_user) { create(:user) }
    let(:accepter_user) { create(:user) }
    let(:request) { FriendshipRequest.create(sender_id: requester_user.id, receiver_id: accepter_user.id) }

    before do
      successful_login accepter_user
    end

    it 'can see the notification via navbar' do
      request
      click_on 'Notifications'

      expect(page).to have_content("#{requester_user.name} wants to be your friend.")
    end

    it 'can see the notification via requester page' do
      request
      visit user_path(requester_user)

      expect(page).to have_content("#{requester_user.name} wants to be your friend.")
    end

    it 'can be accepted via navbar' do
      request
      click_on 'Notifications'
      click_on 'Accept'
      visit user_path(requester_user)

      expect(page).to have_content("#{requester_user.name} feed")
    end
  end
end
