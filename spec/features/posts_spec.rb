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

  feature "user can erase own posts" do
    let(:author) { create :user }
    let(:own_post) { author.posts.create(text: 'This is my own post') }
    before do
      successful_login author
    end

    it "can erase own posts" do
      visit post_path(own_post)
      click_on 'Delete Post'
      visit timeline_path
      expect(page).to_not have_content('This is my own post')
    end
  end
end
