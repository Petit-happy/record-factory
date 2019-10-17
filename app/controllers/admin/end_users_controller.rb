class Admin::EndUsersController < ApplicationController
  def top
    @arrivals = Arrival.all
  end

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @orders = @end_user.orders
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "会員様の情報更新に成功しました。"
      redirect_to admin_end_users_path(@end_user)
    else
      render 'edit'
    end
  end

  def destroy
    @end_user = EndUser.find(params[:id])
    @end_user.destroy
    redirect_to admin_end_users_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:family_name_kanji, :given_name_kanji, :given_name_kana, :family_name_kana, :post_code, :phone_number, :email)
  end
end
