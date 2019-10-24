class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:destroy]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンル名の登録が完了しました"
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:genre_name, tags_attributes: [:id, :_destroy])
    end
end
