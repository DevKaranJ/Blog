# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author).where(author_id: @user.id).paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.includes(:author, :comments).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_posts_path(@user)
    else
      flash[:error] = 'There was an error creating the post.'
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
