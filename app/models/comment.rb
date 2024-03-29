# app/models/comment.rb

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_counter
  after_destroy :update_post_comments_counter

  validates :text, presence: true

  private

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
