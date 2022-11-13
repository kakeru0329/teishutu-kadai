class Public::CustomersController < ApplicationController

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "詳細の変更が完了しました。"
       redirect_to root_path
    else
       flash[:notice] = "詳細の変更内容に不備があります。"
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


end
