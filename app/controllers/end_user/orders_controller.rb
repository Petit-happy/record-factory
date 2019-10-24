class EndUser::OrdersController < ApplicationController
  def create
    #binding.pry
    @order = Order.new(order_params)
    @address = params[:address_id]
    @delivery = Address.find(@address)

    # @order.order_details.build
    current_end_user.carts.each do |cart|
      orderdetail = OrderDetail.new
      orderdetail.order_id = @order.id
      orderdetail.unit = cart.cart_sum
      orderdetail.product_id = cart.product_id
      orderdetail.price = cart.product.price
      order_detail.save
      cart.destroy
    end
    @order.delivery_cost = Order.find(1).delivery_cost
    @order.total_price = Order.total_price_method
    @order.status = 0
    @order.post_code = @delivery.delivery_post_code
    @order.address = @delivery.delivery_address

    @order.save
    #binding.pry
    redirect_to end_user_root_path
  end

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end

end


def order_params
  params.require(:order).permit(
    :delivery_cost,
    :total_price,
    :order_status,
    :order_post_code,
    :order_address,
    addresses_attributes: [:id, :price, :unit, :created_at ]
  )
end