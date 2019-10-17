class EndUser::ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @genre  = @product.genre
    @artist = @product.artist
    # @genre_id = @product.genre_id
    # @genre = Genre.find(@product.genre_id).genre_name
    # binding.pry
    @label = Label.find(@product.label_id).label_name
    # binding.pry
    # @artist = Artist.find(@product.artist_id).artist_name

  end
  def search
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:genre_id, :label_id, :artist_id, :photo_id, :product_price, :sales_status, :product_name, :is_deleted)
    end
end