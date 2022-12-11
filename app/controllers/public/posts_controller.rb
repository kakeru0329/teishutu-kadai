class Public::PostsController < ApplicationController

  before_action :avoid_guest, only:[:new, :create, :destroy]

  def index
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.all
    else
      @posts = Post.page(params[:page]).per(5).order(created_at: :desc)
    end

    if current_customer then
      @customer = Customer.find(current_customer.id)
    end
    @tags = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @customer = Customer.find(current_customer.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.customer_id = current_customer.id
    #flash[:notice] = "投稿できました"
    if @post.save
      redirect_to posts_path
    else
      #flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def search
    @posts = Post.search(params[:search])
    @games = Post.search(params[:search])
    render template: "lists/game"
  end

  def destroy
  end


  private

  def posts_params
    params.require(:post).permit(:background, :evaluation, :review_title, :customer_id, :tag_id)
  end

  def avoid_guest
    @post = Post.new
    if current_customer == Customer.find_by(email: 'guest@example.com')
      redirect_to posts_path
    end
  end

end