class EndUser::EndUsersController < ApplicationController
  PER = 16
  def top
    redirect_to end_user_root_path if params[:keyword] == "" # キーワードが入力されていないとトップページに飛ぶ
    @products = Product.search(params[:search])
    @products = Product.page(params[:page]).reverse_order
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
  end

  def destroy
  end
  private
   def end_user_params
      params.require(:end_user).permit(:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :address, :post_code, :email, :password, :phone_number )
   end
   def product_params
    params.require(:product).permit(:product_price, :sales_status, :product_name, :photo_id)
  end
end