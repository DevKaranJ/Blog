class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    # Assign the comment to the current_user
    @comment.user = current_user

    return unless @comment.save

    redirect_to user_post_path(@post.author, @post), notice: 'Comment created successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
