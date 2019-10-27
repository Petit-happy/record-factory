class Admin::ArrivalsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_arrival, only: [:show, :edit, :update, :destroy]
  PER = 30
  def top
    @arrivals = Arrival.page(params[:page])
  end

  # GET /arrivals
  # GET /arrivals.json
  def index
    @arrivals = Arrival.all
    @products = Product.all
  end

  def new
    @product = Product.find(params[:product_id])
    @arrival = Arrival.new
  end

  def create
    @arrival = Arrival.new(arrival_params)
    @p = Product.find(params[:product_id])
    @arrival.product_id = @p.id #アライバルが持っているプロダクトid
    if @arrival.save
      flash[:notice] = "新規入荷情報の登録が完了しました"
      #binding.pry
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def destroy
    # arrivalにidをもたせる必要がある
    @arrival = Arrival.find(params[:id])
    @arrival.destroy
    redirect_back(fallback_location: admin_root_path)
  end

  private
    def set_arrival
      @arrival = Arrival.find(params[:id])
    end

    def arrival_params
      params.require(:arrival).permit(:product_id, :arrival_sum, :arrived_at)
    end
end
