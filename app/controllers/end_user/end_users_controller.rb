class EndUser::EndUsersController < ApplicationController
  def top
  end

  def edit
    @end_user = EndUser.find(params[:id])
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

  def destroy
  end
  private
   def end_user_params
      params.require(:end_user).permit(:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :address, :post_code, :email, :password, :phone_number )
   end
end