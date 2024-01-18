# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_user, only: %i[index new create]

  def index
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 6)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
