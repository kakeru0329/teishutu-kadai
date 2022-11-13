class Admin::PostsController < ApplicationController

  def index
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.all
    else
      @posts = Post.all
    end
    @tags = Tag.all

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
  end

  private

  def posts_params
    params.require(:post).permit(:background, :evaluation, :review_title, :customer_id, :tag_id)
  end

end