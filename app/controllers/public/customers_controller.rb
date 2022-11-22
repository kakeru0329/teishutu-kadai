class Public::CustomersController < ApplicationController
  
  before_action :avoid_guest, only:[:edit, :update, :withdraw]

  def edit
   
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "詳細の変更が完了しました。"
       redirect_to root_path
    else
       flash.now[:alert] = "詳細の変更内容に不備があります。"
       render :edit
    end
  end

  def unsubscribe

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :age, :email, :is_deleted)
  end
  
  def avoid_guest
    @customer = Customer.find(params[:id])
    if @customer.email == "guest@example.com"
      redirect_to root_path
    end
  end

end

