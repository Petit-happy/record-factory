class EndUser::CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_end_user!

  def index
    @cart_items = current_end_user.cart_items
    @products = Product.all
  end
  def new
    @cart_item = CartItem.new
  end
  def create
    product = Product.find(params[:product_id])
    # ##カートの中０でカートを作ろうとした時
    cart_item = CartItem.new(cart_item_params)
    cart_item.product_id = product.id
    cart_item.end_user_id = current_end_user.id
    if cart_item.save
      redirect_to end_user_cart_items_path
      else
      flash[:notice] = "カート作成エラーです"
      redirect_back(fallback_location: end_user_root_path)
    end
  end
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to end_user_cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 # current_userが持っているcartの一括削除
  def destroy_all
    cart_items = current_end_user.cart_items
    cart_items.each do |cart_item|
      cart_item.destroy
    end
    redirect_to end_user_cart_items_path
  end

  def order_check
    @end_user = current_end_user
    addresses = @end_user.addresses
    @addresses_for_options = Hash.new
    addresses.each do |address|
      @addresses_for_options.store(address.delivery_address, address.id)
    end
  end
  def confirmation
    @order = Order.new
    @cart_items = current_end_user.cart_items
    @address = params[:address_id]
    @delivery = Address.find(@address)
    @method_of_payment = params[:method_of_payment]
    if @method_of_payment == 0
        @payment = "クレジットカード"
    elsif @method_of_payment == 1
        @payment ="銀行振込"
    else @mehod_of_payment == 2
        @payment ="代引き"
    end
  end

  def fix
    @order = Order.find(params[:order_id])
    @order_details = @order.order_details
  end

private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end
    def cart_item_params
      params.require(:cart_item).permit(:end_user_id, :product_id, :cart_sum)
    end
    def _params
      params.permit(:name, :content)
    end
end
