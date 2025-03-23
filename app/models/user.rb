class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :car_listings, :class_name => 'Classifieds::CarListing', dependent: :destroy
  has_many :car_parts, :class_name => 'Classifieds::CarPart', dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

end
