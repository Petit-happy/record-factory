class EndUser::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # GET /products/1
  # GET /products/1.json
  def show
    set_product
  end
  def search
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:genre_id, :label_id, :artist_id, :photo_id, :product_price, :sales_status, :product_name, :is_deleted)
    end
end