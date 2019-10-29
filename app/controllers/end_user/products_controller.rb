class EndUser::ProductsController < ApplicationController
  before_action :authenticate_end_user!
  PER = 20
  def show
    @product = Product.find(params[:id])
    @disc = @product.discs
    @songs = Song.all
    @cart_item = CartItem.new
  end
  def search
  end

private
    def product_params
      params.require(:product).permit(:genre_id, :label_id, :artist_id, :photo_id, :product_price, :sales_status, :product_name, :deleted_at)
    end
end
