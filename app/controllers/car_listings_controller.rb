class CarListingsController < ApplicationController
  allow_unauthenticated_access only: [:index, :show]
  # before_action :require_authentication, except: [:index, :show]
  before_action :set_car_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def index
    @car_listings = CarListing.all
  end

  def show
  end

  def new
    @car_listing = Current.user.car_listings.build
  end

  def create
    @car_listing = Current.user.car_listings.build(car_listing_params)
    if @car_listing.save
      redirect_to @car_listing, notice: 'Car Listing was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car_listing.update(car_listing_params)
      redirect_to @car_listing, notice: 'Car Listing was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @car_listing.destroy
    redirect_to car_listings_path, notice: 'Car Listing deleted.'
  end

  private
  def set_car_listing
    @car_listing = CarListing.find(params[:id])
  end

  def car_listing_params
    params.require(:car_listing).permit(:title, :description, :price, :year, :make, :model, :mileage, images: [])
  end

  def authorize_owner!
    unless Current.user&.admin? || @car_listing.user == Current.user
      flash[:alert] = 'You are not authorized to edit this listing.'
      redirect_to @car_listing
    end
  end

end
