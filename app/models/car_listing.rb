class CarListing < ApplicationRecord
  belongs_to :user
  validates :title, :description, :price, :year, :make, :model, :mileage, presence: true
  has_many_attached :images

  after_save :resize_images


  private
  def resize_images
    images.each do |image|
      image.variant(resize_to_limit: [500, 500])
    end
  end

end
