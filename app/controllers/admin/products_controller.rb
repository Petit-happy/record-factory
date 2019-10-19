class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
  end

  def edit
  end

  def new
  end
end
