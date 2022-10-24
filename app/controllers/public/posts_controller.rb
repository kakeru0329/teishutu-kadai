class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #@review = Review.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.save
    flash[:notice] = "投稿できました"
    redirect_to posts_path
  end

  def search
    if params[:keyword].present?
      @posts = Post.where('caption LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  private

  def posts_params
    params.require(:post).permit(:background, :evaluation)
  end

end