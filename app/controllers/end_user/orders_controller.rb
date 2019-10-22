class EndUser::OrdersController < ApplicationController
  
  def create
    @order.save
  end

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end

  def order_check
      @order = Order.new
      addresses = Address.all
      @addresses_for_options = Hash.new
      addresses.each do |address|
      @addresses_for_options.store(address.delivery_address, address.id)
      end
  end

  def confirmation
  end
end
