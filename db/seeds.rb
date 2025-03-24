# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(email: "x4nocide@gmail.com", password: "password")

Classifieds::CarListing.create!(title: "car list testing 1", description: "car list testing 1", price: 100000, year: 2000, make: "ford_test", model: "mustang_test", mileage: 1000000)

Classifieds::CarPart.create!(title: "car part testing 1", year: 2000, make: "nissan_test", model: "skyline_test" description: "car part testing 1", price: 100000)