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
  end
end
