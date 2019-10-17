class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end


private
  def order_params
    params.require(:order).permit(:order_id, :product_id, :price, :unit)
  end
end

