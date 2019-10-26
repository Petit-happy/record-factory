class Admin::LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]

  def index
    @label = Label.new
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      flash[:notice] = "レーベル名の登録が完了しました"
      redirect_to admin_labels_path
    else
      @labels = Label.all
      render :index
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to admin_labels_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:label_name)
    end
end
