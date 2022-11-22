class Public::CommentsController < ApplicationController

  before_action :avoid_guest, only:[:create, :destroy]

  def create
    post = Post.find(params[:post_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

   private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def avoid_guest
    
    if current_customer == Customer.find_by(email: 'guest@example.com')
      redirect_to post_path
    end
  end

end