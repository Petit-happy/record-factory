class EndUser::OrdersController < ApplicationController
  def create
    @order = Order.new(order_status: :accept)
    @address = params[:order][:address_id]
    @delivery = Address.find(@address)
    @cart_items = current_end_user.cart_items
    @cart_items.each do |cart|
      order_detail = @order.order_details.build
      order_detail.order_id = @order.id
      order_detail.unit = cart.cart_sum
      order_detail.product_id = cart.product_id
      order_detail.price = cart.product.product_price
      order_detail.save
      cart.destroy
    end
    @order.end_user_id = current_end_user.id
    @order.delivery_cost = Order.find(1).delivery_cost
    @order.total_price = CartItem.total_cart_price(@cart_items)
    # @order.status = 0
    @order.order_post_code = @delivery.delivery_post_code
    @order.order_address = @delivery.delivery_address
    @order.save
    redirect_to end_user_cart_items_fix_path
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