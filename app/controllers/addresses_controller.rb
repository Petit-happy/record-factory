class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to end_user_end_user_path(current_end_user.id)
  end

  def update
    # respond_to do |format|
      # if
        @address = Address.find(params[:id])
        @address.update(address_params)
        redirect_to end_user_end_user_path(@address.end_user)
        # format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        # format.json { render :show, status: :ok, location: @address }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @address.errors, status: :unprocessable_entity }
      # end
    # end
  end

  def destroy
    @address= Address.find(params[:id])
    @address.destroy
    redirect_to end_user_end_user_path(current_end_user.id)
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:end_user_id, :delivery_address, :delivery_name, :delivery_post_code)
    end
end
