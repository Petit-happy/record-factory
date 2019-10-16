class Admin::EndUsersController < ApplicationController
  def top
    @arrivals = Arrival.all
    #@products = Product.all
  end

  def index
    @end_users = EndUser.all
  end

  def show
  end

  def edit
  end
end
