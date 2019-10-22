class Admin::ArrivalsController < ApplicationController
  before_action :set_arrival, only: [:show, :edit, :update, :destroy]

  def top
    @arrivals = Arrival.all
    #@products = Product.all
  end

  # GET /arrivals
  # GET /arrivals.json
  def index
    @arrivals = Arrival.all
    @products = Product.all

  end

  # GET /arrivals/1
  # GET /arrivals/1.json
  def show
  end

  # GET /arrivals/new
  def new
    @product = Product.find(params[:product_id])
    @arrival = Arrival.new
  end


  # POST /arrivals
  # POST /arrivals.json
  def create
    @arrival = Arrival.new(arrival_params)
    @p = Product.find(params[:product_id])
    @arrival.product_id = @p.id #アライバルが持っているプロダクトid
    @arrival.save
    #binding.pry
    redirect_to admin_root_path
  end


  # DELETE /arrivals/1
  # DELETE /arrivals/1.json
  def destroy
    # arrivalにidをもたせる必要がある
    @arrival = Arrival.find(params[:id])
    @arrival.destroy
    redirect_back(fallback_location: admin_root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrival
      @arrival = Arrival.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arrival_params
      params.require(:arrival).permit(:product_id, :arrival_sam, :arrived_at)
    end
end
