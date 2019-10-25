class Admin::OrdersController < ApplicationController
  PER = 30
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスの更新が完了しました"
      redirect_to admin_orders_path
    else
      render 'edit'
    end
  end


private
  def order_params
    params.require(:order).permit(:order_id, :end_user_id, :delivery_cost, :total_price, :order_status, :order_post_code, :order_address)
  end
end
