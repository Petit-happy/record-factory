class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end


private
  def order_params
    params.require(:order).permit(:order_id, :end_user_id, :delivery_cost, :total_price, :order_status, :order_post_code, :order_address)
  end
end
