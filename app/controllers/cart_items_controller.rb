class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]


  def index
    @cart_items = CartItem.all
  end


  def show
  end


  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to '/top'
  end

  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end
    def cart_item_params
      params.require(:cart_item).permit(:end_user_id, :product_id, :cart_sum, :cart_sum)
    end
end
