class CreateClassifiedsCarParts < ActiveRecord::Migration[8.0]
  def change
    create_table :classifieds_car_parts do |t|
      t.timestamps
    end
  end
end
