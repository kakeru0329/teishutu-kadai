class Public::HomesController < ApplicationController
  #before_action authenticate_user!
  def top
    @posts = Post.all
    if current_customer then
      @customer = Customer.find(current_customer.id)
      
    end
  end
end