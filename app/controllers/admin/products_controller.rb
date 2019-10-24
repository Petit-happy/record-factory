class Admin::ProductsController < ApplicationController
  PER = 16
  def index
    unless params[:search].blank?
      @products = Product.left_joins(:artist).left_joins(discs: :songs).where("(artists.artist_name LIKE ?) or (songs.song_name LIKE ?) or (products.product_name LIKE ?)","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%").page(params[:page]).distinct

#      artist = Product.joins(:artist).where("artist_name LIKE ?", "%#{params[:search]}%")
#      song =  Product.joins(discs: :songs).where("song_name LIKE ?", "%#{params[:search]}%")
#      title = Product.where("product_name LIKE ?", "%#{params[:search]}%")
#      merged_result = artist | title
#      @products = merged_result | song
    else
      @products = Product.all.page(params[:page])
    end
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
      flash[:notice] = "商品情報の更新が完了しました"
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
