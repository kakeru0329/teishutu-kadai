class Admin::CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    redirect_to admin_post_path(@post)
  end

   private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end