# spec/features/user_show_spec.rb
require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  let!(:user) { FactoryBot.create(:user, username: 'user', bio: 'This is a bio') }

  scenario 'I can see the user\'s details and posts' do
    visit user_path(user)

    expect(page).to have_content('user')
    expect(page).to have_selector('img.profile-picture') # Assuming there's an image with class 'profile-picture'
    expect(page).to have_content('Posts: 0') # Assuming the user has not written any posts yet

    expect(page).to have_content('This is a bio')

    # Create some posts for the user
    FactoryBot.create_list(:post, 5, user: user)

    visit user_path(user) # Refresh the page after creating posts

    expect(page).to have_content('Posts: 5', count: 1)
    expect(page).to have_selector('div.post', count: 3) # Assuming there's a div with class 'post'
  end

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    post = FactoryBot.create(:post, user: user)

    visit user_path(user)

    click_link post.title

    expect(current_path).to eq(post_path(post))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post index page' do
    FactoryBot.create_list(:post, 5, user: user)

    visit user_path(user)

    click_link 'View all posts'

    expect(current_path).to eq(user_posts_path(user))
  end
end
