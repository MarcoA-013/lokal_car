class RenameColumnNameToBrandInCarBrands < ActiveRecord::Migration[7.0]
  def change
    rename_column :car_brands, :name, :brand
  end
end
