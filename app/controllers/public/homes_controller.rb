# frozen_string_literal: true

class Public::HomesController < ApplicationController
  # before_action authenticate_user!
  def top
    @posts = Post.limit(4).offset(0).order(created_at: :desc)
    if current_customer then
      @customer = Customer.find(current_customer.id)
      @favorites = Favorite.where(customer_id: current_customer.id)
      if params[:keyword]
        @games = Post.search(params[:search])
      end
    end

    # ログインいていないユーザーが投稿、詳細を見れないようにする
    # flash[:notice] = "レビューの投稿,詳細閲覧を行うにはログインする必要があります"
    # render :top
  end
end
