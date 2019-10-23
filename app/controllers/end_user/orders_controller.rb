class EndUser::OrdersController < ApplicationController
  
  def create
    @order = Order.new
    @order.save
    redirect_to end_user_orders_order_check_path
  end

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end

end