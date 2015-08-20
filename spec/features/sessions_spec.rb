require 'rails_helper'

describe 'User Sessions' do
  let(:user) { create(:user) }
  let(:email) { user.email }
  let(:password) { user.password }
  let(:name) { user.name }



  feature 'Begin session' do

    context 'Success' do
      before { successful_login user }

      it 'informs success' do
        within('.notice') { expect(page).to have_content('Signed in successfully.') }
      end

      it "goes to user's home page" do
        within('h2') { expect(page).to have_content("#{name}'s Home") }
      end

    end
    context 'Failure' do
      before { failed_login user }

      it 'informs failure' do
        within('.alert') { expect(page).to have_content('Invalid email or password.') }
      end

      it 'shows login again' do
        within('h2') { expect(page).to have_content("Log in") }
      end
    end
  end

  feature 'End session' do
    before do
      successful_login user
      within('nav') { click_on 'Log Out' }
    end

    it 'do not show a navbar' do
      expect(page.has_css?('nav')).to be false
    end

    it 'permits a new login' do
      within('h2') { expect(page).to have_content("Log in") }
    end
  end
end
