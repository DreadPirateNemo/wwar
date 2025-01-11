class CarListing < ApplicationRecord
  belongs_to :user

  validates :title, :description, :price, :year, :make, :model, :mileage, presence: true
end
