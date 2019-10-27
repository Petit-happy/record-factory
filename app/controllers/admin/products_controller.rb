class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin_user!
  PER = 16
  def index
    unless params[:search].blank?
      @products = Product.left_joins(:artist).left_joins(discs: :songs).where("(artists.artist_name LIKE ?) or (songs.song_name LIKE ?) or (products.product_name LIKE ?)","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%").page(params[:page]).distinct
    else
      @products = Product.with_deleted.all.page(params[:page])
    end
  end

  def show
    @product = Product.find(params[:id])
    @discs = @product.discs
  end

  def edit
    @product = Product.find(params[:id])
    @disc = @product.discs
    @songs = Song.all
  end

  def new
    @product = Product.new
    @disc = @product.discs.build
    @song = @disc.songs.build
    genres = Genre.all
    labels = Label.all
    # ==genre,select作る==
    @genres_for_options = Hash.new
    genres.each do |g|
      @genres_for_options.store(g.genre_name, g.id)
    end
    #==label,selectを作る==
    @labels_for_options = Hash.new
    labels.each do |l|
      @labels_for_options.store(l.label_name, l.id)
    end
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

  def create
    @product = Product.new(product_params)
    #=====アーティストidをプロダクトに入れる======
      artists = Artist.all
      hash = artist_params
      artists.each do |artist|
        if artist.artist_name == hash["name"]
          @product.artist_id = artist.id
        end
      end
    #=====アーティストidをプロダクトに入れる======
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      genres = Genre.all
      @genres_for_options = Hash.new
        genres.each do |g|
          @genres_for_options.store(g.genre_name, g.id)
        end
      labels = Label.all
      @labels_for_options = Hash.new
        labels.each do |l|
          @labels_for_options.store(l.label_name, l.id)
        end
      render new_admin_product_path
    end
  end

  def destroy
    @order = Product.find(params[:id])
    @order.destroy
    redirect_to admin_products_path
  end

  private
  #createさせるために必要な情報！
  def product_params
    params.require(:product).permit(:product_price, :sales_status, :product_name, :artist_id, :label_id, :genre_id, :photo, :image, discs_attributes: [:id, :disc_no, :_destroy, songs_attributes: [:id, :song_no, :song_name, :_destroy]])
  end
  def artist_params
    params.require(:artist).permit(:name)
  end
end
