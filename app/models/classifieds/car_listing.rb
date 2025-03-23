module Classifieds
  class CarListing < ApplicationRecord
    belongs_to :user
    validates :title, :description, :price, :year, :make, :model, :mileage, presence: true
    has_many_attached :images

    after_save :resize_images

    def self.ransackable_attributes(auth_object = nil)
      %w[description make mileage model price title year]
    end

    def self.ransackable_associations(auth_object = nil)
      %w[images_attachments images_blobs]
    end


    private
    def resize_images
      images.each do |image|
        image.variant(resize_to_limit: [500, 500])
      end
    end
  end
end
