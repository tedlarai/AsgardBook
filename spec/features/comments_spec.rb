require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let(:author) { FactoryGirl.create(:user) }
  let(:commenter) { FactoryGirl.create(:user) }
  let(:authored_post) { author.posts.create(text: 'Fuuuuu') }


  before do
    successful_login commenter
    visit post_path(authored_post)
  end

  it 'can be added by a user' do
     fill_in 'Leave a comment:', with: 'This is my comment'
     click_on 'Submit comment'

     within('#comments') { expect(page).to have_content('This is my comment') }
  end
end
