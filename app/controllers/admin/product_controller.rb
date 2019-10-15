class Admin::ProductController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def search
    @products = Product.search(params[:search])
  end
end
