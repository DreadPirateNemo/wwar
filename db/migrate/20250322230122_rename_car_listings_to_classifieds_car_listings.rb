class RenameCarListingsToClassifiedsCarListings < ActiveRecord::Migration[8.0]
  def change
    rename_table :car_listings, :classifieds_car_listings
  end
end
