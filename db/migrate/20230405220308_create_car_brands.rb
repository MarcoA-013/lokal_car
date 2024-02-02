class CreateCarBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :car_brands do |t|
      t.string :brand_name

      t.timestamps
    end
  end
end
