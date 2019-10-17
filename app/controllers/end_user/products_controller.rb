class EndUser::ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @artist = @product.artist
    # binding.pry
    # binding.pry

  end
  def search
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:genre_id, :label_id, :artist_id, :photo_id, :product_price, :sales_status, :product_name, :is_deleted)
    end
end