require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  feature "User can create post" do
    let(:author) { create(:user) }
    before do
      successful_login author
    end

    it "can create a post" do
      visit home_path
      click_on "New Post"
      fill_in "Text", with: "This is the text of the post!!"
      click_on "Submit"

      within('h2') { expect(page).to have_content("Timeline") }
      expect(page).to have_content("This is the text of the post!!")
    end
  end
end
