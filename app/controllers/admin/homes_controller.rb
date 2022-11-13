class Admin::HomesController < ApplicationController
  def top
    @posts = Post.all
    if current_customer then
      @customer = Customer.find(current_customer.id)
      @favorites = Favorite.where(customer_id: current_customer.id)
    end
  end
end
