class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private

  def customers_params
    params.require(:customer).permit(:name, :age, :email, :is_deleted)
  end


end
