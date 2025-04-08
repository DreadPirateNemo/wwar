class DashboardController < ApplicationController
  def index
    @car_listings = Classifieds::CarListing.where(user_id: Current.user.id)
    @part_listings = Classifieds::CarPart.where(user_id: Current.user.id)
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
