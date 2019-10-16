class Admin::OrdersController < ApplicationController
  def index
    #@orders = Order.all
    @users = End_user.all
  end

  def show
  end
end
