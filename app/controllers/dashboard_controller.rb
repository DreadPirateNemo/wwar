class DashboardController < ApplicationController
  def index
    @car_listings = Current.user.car_listings
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
