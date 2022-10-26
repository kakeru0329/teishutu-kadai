class Public::CommentsController < ApplicationController

  def create
    post = Post.find(params[:pst_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end
end