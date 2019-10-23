class EndUser::CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]


  def index
    @cart_items = CartItem.all
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
    cart_item.save
    # binding.pry
  end

  # post_image = PostImage.find(params[:post_image_id])
  # comment = current_user.post_comments.new(post_comment_params)
  # comment.post_image_id = post_image.id
  # comment.save
  # redirect_to post_image_path(post_image)

  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def order_check
    addresses = Address.all
    @addresses_for_options = Hash.new
    addresses.each do |address|
      @addresses_for_options.store(address.delivery_address, address.id)
    end
  end
  def confirmation
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end
    def cart_item_params
      params.require(:cart_item).permit(:end_user_id, :product_id, :cart_sum)
    end
    
    
end
