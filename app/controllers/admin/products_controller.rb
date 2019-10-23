class Admin::ProductsController < ApplicationController
  PER = 16
  def index
    redirect_to admin_products_path if params[:keyword] == "" # キーワードが入力されていないとトップページに飛ぶ
    @products = Product.search(params[:search])
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @disc = @product.discs
    @songs = Song.all
  end

  def edit
    @product = Product.find(params[:id])
    @disc = @product.discs
    @songs = Song.all
  end

  def new
    @product = Product.new
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "successfully updated"
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def destroy
    @order = Product.find(params[:id])
    @order.destroy
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:product_price, :sales_status, :product_name, :photo_id)
  end
end
