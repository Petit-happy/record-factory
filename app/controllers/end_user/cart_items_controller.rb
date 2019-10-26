class EndUser::CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_end_user!

  def index
    @cart_items = current_end_user.cart_items
    # binding.pry
  end


  def show
  end


  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    cart_item = CartItem.new(cart_item_params)
    cart_item.product_id = product.id
    cart_item.end_user_id = current_end_user.id
    cart_item.save
    redirect_back(fallback_location: end_user_root_path)
  end

  # post_image = PostImage.find(params[:post_image_id])
  # comment = current_user.post_comments.new(post_comment_params)
  # comment.post_image_id = post_image.id
  # comment.save
  # redirect_to post_image_path(post_image)

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
    addresses = Address.all
    @addresses_for_options = Hash.new
    addresses.each do |address|
      @addresses_for_options.store(address.delivery_address, address.id)
    end
  end
  def confirmation
    @order = Order.new
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