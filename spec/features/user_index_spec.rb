# spec/features/user_index_spec.rb

require 'rails_helper'

RSpec.feature 'User Index Page' do
  let!(:user1) { create(:user, name: 'John', posts_counter: 5) }
  let!(:user2) { create(:user, name: 'Jane', posts_counter: 3) }

  scenario 'I can see the username, profile picture' do
    visit users_path

    # Check if the usernames are visible
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)

    # Check if the profile pictures are visible
    expect(page).to have_css("img[src*='#{user1.photo.url}']")
    expect(page).to have_css("img[src*='#{user2.photo.url}']")
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    visit users_path

    # Click on the first user's link
    click_link user1.name

    # Check if redirected to the user's show page
    expect(current_path).to eq(user_path(user1))
  end
end
