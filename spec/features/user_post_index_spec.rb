require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  before do
    @user = create(:user, photo: Rails.root.join('spec/fixtures/profile.jpg'))
    @posts = create_list(:post, 5, author: @user, text: 'Lorem ipsum dolor sit amet')
    visit user_posts_path(@user)
  end

  scenario 'I can see the user\'s profile picture' do
    expect(page).to have_css('img.user-photo', count: 1)
  end

  scenario 'I can see the user\'s name' do
    expect(page).to have_css('h2.username', text: @user.name, count: 1)
  end

  scenario 'I can see the number of posts the user has' do
    expect(page).to have_css('h4.postnumber', text: 'Number of posts: 5', count: 1)
  end

  scenario 'I can see some details of each post' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text[0..50])
    end
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    create_list(:post, 6, author: @user)
    visit user_posts_path(@user)
    expect(page).to have_css('.pagination')
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    @posts.first.save
    visit user_posts_path(@user)
    find("a[href='#{user_post_path(@user, @posts.first)}']").click
    expect(page).to have_current_path(user_post_path(@user, @posts.first))
  end
end
