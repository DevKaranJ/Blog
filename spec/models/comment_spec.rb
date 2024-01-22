# spec/models/comment_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "decrements the post's comments_counter after destroy" do
    user = User.create(name: 'Roy Batty', posts_counter: 5)
    post = Post.create(title: 'Sample Title', author: user, text: 'This is my first post', comments_counter: 1,
                       likes_counter: 0)
    comment = Comment.create(user: user, post: post)

    # Instead of using count, we can directly use the counter_cache attribute
    comment.destroy
    expect(post.reload.comments_counter).to eq(0)
  end
end
