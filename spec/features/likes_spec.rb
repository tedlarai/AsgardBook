require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  let(:author) { FactoryGirl.create(:user) }
  let(:liker) { FactoryGirl.create(:user) }
  let(:post_to_like) { author.posts.create(text: "Fuuuuu") }
  let(:like) { post_to_like.likes.create(liker_id: liker.id) }

  it 'can like not liked posts' do
    successful_login liker
    visit post_path(post_to_like)
    click_on "Like"

    within('#post_likers') { expect(page).to have_content("#{liker.name}") }
    expect(page).to have_content('Unlike')
  end

  it 'can unlike liked posts' do
    successful_login liker
    like
    visit post_path(post_to_like)
    click_on 'Unlike'

    within('#post_likers') { expect(page).to_not have_content("#{liker.name}") }
    expect(page).to have_content('Like')
  end

end
