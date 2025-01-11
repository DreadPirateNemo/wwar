class CreateCarListings < ActiveRecord::Migration[8.0]
  def change
    create_table :car_listings do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :year
      t.string :make
      t.string :model
      t.integer :mileage
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
