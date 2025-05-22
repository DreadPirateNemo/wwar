module Classifieds
  class HubController < ApplicationController
    allow_unauthenticated_access only: [:index]

    def index
      # @q = Classifieds::CarPart.ransack(params[:q]) + Classifieds::CarListing.ransack(params[:q])
      # @classifieds = @q.result || Classifieds::CarPart.all + Classifieds::CarListing.all

      car_listings_search = Classifieds::CarListing.ransack(params[:q])
      car_parts_search = Classifieds::CarPart.ransack(params[:q])

      @car_listings = car_listings_search.result
      @car_parts = car_parts_search.result

      @classifieds = (@car_listings + @car_parts).sort_by(&:created_at).reverse
    end
  end
end