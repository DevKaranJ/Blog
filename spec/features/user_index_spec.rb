# spec/features/user_index_spec.rb

require 'rails_helper'

RSpec.feature 'User index page' do
  let!(:user1) { FactoryBot.create(:user, name: 'user1', posts_counter: 3) }

  scenario 'I can see the name, profile picture, and post count for each user' do
    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    visit users_path

    find("a", text: user1.name).click

    expect(current_path).to eq(user_path(user1))
    # Add other expectations for the user's show page
  end
end
