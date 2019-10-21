class EndUser::OrdersController < ApplicationController
  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end

  def order_check
  end

  def confirmation
  end
end
