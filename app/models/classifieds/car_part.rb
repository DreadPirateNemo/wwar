module Classifieds
  class CarPart < ApplicationRecord
    belongs_to :user
    validates :title, :year, :make, :model, :description, :price, presence: true
    has_many_attached :images

    after_save :resize_images

    def self.ransackable_attributes(auth_object = nil)
      %w[title year make model description price]
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
