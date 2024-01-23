# spec/features/user_show_spec.rb

require 'rails_helper'

RSpec.feature 'User Show Page' do
  let!(:user) { create(:user, name: 'John', bio: 'Sample Bio') }
  let!(:post1) { create(:post, author: user, title: 'Post 1', text: 'Lorem ipsum', comments_counter: 2, likes_counter: 5) }
  let!(:post2) { create(:post, author: user, title: 'Post 2', text: 'Dolor sit amet', comments_counter: 1, likes_counter: 8) }
  let!(:post3) { create(:post, author: user, title: 'Post 3', text: 'Consectetur adipiscing elit', comments_counter: 0, likes_counter: 3) }

  scenario 'I can see user details and posts on the user show page' do
    visit user_path(user)

    # Check if the user's profile picture is visible
    expect(page).to have_css("img.user-photo[src*='#{user.photo.url}']") if user.photo.present?

    # Check if the user's username is visible
    expect(page).to have_content(user.name)

    # Check if the number of posts the user has written is visible
    expect(page).to have_content("Number of posts: #{user.posts.count}")

    # Check if the user's bio is visible
    expect(page).to have_content('Bio')
    expect(page).to have_content(user.bio)

    # Check if the first 3 posts are visible
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)

    # Check if the button to view all posts is visible
    expect(page).to have_link('See all posts', href: user_posts_path(user)) if user.posts.count > 3
  end

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    visit user_path(user)

    # Click on the first post's link
    click_link 'Post 1'

    # Check if redirected to the post's show page
    expect(current_path).to eq(user_post_path(user, post1))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
    visit user_path(user)

    # Check if the button to view all posts is visible
  if user.recent_posts.count > 3
    expect(page).to have_link('See all posts', href: user_posts_path(user))

    # Click on the "See all posts" button
    click_link 'See all posts'

    # Check if redirected to the user's post index page
    expect(current_path).to eq(user_posts_path(user))
  end
  end
end
