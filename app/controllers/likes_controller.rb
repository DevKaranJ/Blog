class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(like_params)
    @like.user = current_user

    return unless @like.save

    redirect_to @post, notice: 'Liked the post!'
  end

  private

  def like_params
    params.require(:like).permit(:user_id)
  end
end
