class Public::PostsController < ApplicationController
  def index
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.customer_id = current_customer.id

    flash[:notice] = "投稿できました"
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def search
    if params[:keyword].present?
      @posts = Post.where('caption LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  def destroy
  end


  private

  def posts_params
    params.require(:post).permit(:background, :evaluation, :review_title, :customer_id)
  end

end