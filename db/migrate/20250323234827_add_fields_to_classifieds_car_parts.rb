class AddFieldsToClassifiedsCarParts < ActiveRecord::Migration[8.0]
  def change
    add_column :classifieds_car_parts, :title, :string
    add_column :classifieds_car_parts, :year, :integer
    add_column :classifieds_car_parts, :make, :string
    add_column :classifieds_car_parts, :model, :string
    add_column :classifieds_car_parts, :description, :text
    add_column :classifieds_car_parts, :price, :decimal
  end
end
