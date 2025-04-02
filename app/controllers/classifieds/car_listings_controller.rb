module Classifieds
  class CarListingsController < ApplicationController
    allow_unauthenticated_access only: [:index, :show]
    # before_action :require_authentication, except: [:index, :show]
    before_action :set_car_listing, only: [:show, :edit, :update, :destroy]
    before_action :authorize_owner!, only: [:edit, :update, :destroy]

    def index
      @q = Classifieds::CarListing.ransack(params[:q])
      @car_listings = @q.result || Classifieds::CarListing.all
    end

    def show
    end

    def new
      @car_listing = Current.user.car_listings.build
      render layout: false if turbo_frame_request?
    end


    def create
      Rails.logger.debug(params.inspect) # Logs all incoming parameters to the console
      @car_listing = Current.user.car_listings.build(car_listing_params)
      if @car_listing.save
        # redirect_to classifieds_car_listing_path(@car_listing), notice: 'Car Listing was successfully created.'
        flash.now[:notice] = 'Car Listing was successfully created.'
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to @car_listing, notice: 'Car Listing created!' }
        end
      else
        Rails.logger.debug(@car_listing.errors.full_messages)
        # Logs validation errors
        # render :new
        render partial: 'shared/modal', status: :unprocessable_entity
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
      redirect_to classifieds_car_listing_path, notice: 'Car Listing deleted.'
    end

    private
    def set_car_listing
      @car_listing = Classifieds::CarListing.find(params[:id])
    end

    def car_listing_params
      params.require(:classifieds_car_listing).permit(:title, :description, :price, :year, :make, :model, :mileage, images: [])
    end

    def authorize_owner!
      unless @car_listing.user == Current.user
        flash[:alert] = 'You are not authorized to edit this listing.'
        redirect_to @car_listing
      end
    end

  end
end
