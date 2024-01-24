# spec/features/post_show_spec.rb

require 'rails_helper'

RSpec.feature 'Post Show Page', type: :feature do
  let(:user) { create_user(name: 'John Doe') }

  before do
    # Create a post with associated comments and likes for testing
    @post = create_post(author: user, title: 'Test Post', text: 'Lorem ipsum')
    create_comments(@post, count: 3)
    create_likes(@post, count: 2)

    visit user_post_path(user, @post)
  end

  private

  def create_user(attributes)
    User.create!(attributes.merge(posts_counter: 0))
  end

  def create_post(attributes)
    Post.create!(attributes.merge(comments_counter: 0, likes_counter: 0)).tap do |post|
      post.author.increment!(:posts_counter)
    end
  end

  def create_comment(post, attributes)
    user = attributes[:user] || create_user(name: 'Default User') # Provide a default user if not specified
    Comment.create!(attributes.merge(post: post, user: user)).tap do |comment|
      comment.user.increment!(:comments_counter)
      post.increment!(:comments_counter)
    end
  end

  def create_comments(post, count:)
    count.times { create_comment(post, text: 'A comment') }
  end

  def create_like(post, attributes)
    Like.create!(attributes.merge(post: post)).tap do |like|
      like.user.increment!(:likes_counter)
      post.increment!(:likes_counter)
    end
  end

  def create_comment(post, attributes)
    user = attributes[:user] || create_user(name: 'Default User') # Provide a default user if not specified
    Comment.create!(attributes.merge(post: post, user: user))
  end

  def create_likes(post, count:)
    count.times { create_like(post, user: user) }
  end
end
