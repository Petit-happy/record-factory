class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @disc = @product.discs
    @songs = Song.all
  end

  def search
  end

  def edit
  end

  def new
    @product = Product.find(1)
    @disc = @product.discs
    @song = Song.all
    # binding.pry
  end

  def update

  end

  def create

  end

  private

  def product_params
    params.require(:product).permit(:photo_id)
  end
end
