class Public::PostsController < ApplicationController
  def index
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.all
    else
      @posts = Post.all
    end

    if current_customer then
      @customer = Customer.find(current_customer.id)
    end
    @tags = Tag.all

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
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def search
    if params[:keyword]
      @games = RakutenWebService::Books::Game.search(title: params[:keyword])
    end
  end

  def destroy
  end


  private

  def posts_params
    params.require(:post).permit(:background, :evaluation, :review_title, :customer_id, :tag_id)
  end

end