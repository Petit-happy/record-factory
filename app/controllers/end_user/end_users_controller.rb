class EndUser::EndUsersController < ApplicationController
  def top
  end

  def edit
    @end_user = EndUser.find(end_user_params[:id])
  end

  def show
  end

  def update
  end

  def destroy
  end
  private
   def end_user_params
      params.require(:end_user).permit(:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :address, :post_code, :email, :password, :phone_number )
   end
end
