class Admin::ArtistsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artist = Artist.new
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "アーティスト名の登録が完了しました"
      redirect_to admin_artists_path
    else
      @artists = Artist.all
      render :index
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to admin_artists_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:artist_name)
    end
end
