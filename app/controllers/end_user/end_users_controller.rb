class EndUser::EndUsersController < ApplicationController
  PER = 16
  def top
    unless params[:search].blank?
      @products = Product.left_joins(:artist).left_joins(discs: :songs).where("(artists.artist_name LIKE ?) or (songs.song_name LIKE ?) or (products.product_name LIKE ?)","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%").page(params[:page]).distinct
    else
      @products = Product.with_deleted.all.page(params[:page]).per(24)
    end
  end

  def edit
    @end_user = EndUser.find(params[:id])
    @addresses = @end_user.address
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def update
      @end_user = EndUser.find(params[:id])
      if @end_user.update(end_user_params)
        flash[:notice] = "会員様の情報更新に成功しました。"
        redirect_to end_user_end_user_path(@end_user)
      else
        render 'edit'
      end
  end

  def leave
    @end_user = current_end_user
  end

  def destroy
    @end_user = EndUser.find(params[:id])
    @end_user.destroy
    respond_to do |format|
      format.html { redirect_to end_user_root_url, notice: '退会処理が完了いたしました' }
    end
  end
  private
   def end_user_params
      params.require(:end_user).permit(:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :address, :post_code, :email, :password, :phone_number )
   end
   def product_params
    params.require(:product).permit(:product_price, :sales_status, :product_name, :photo_id)
  end
end
