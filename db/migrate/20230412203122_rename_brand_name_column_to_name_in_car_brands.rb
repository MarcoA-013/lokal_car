class RenameBrandNameColumnToNameInCarBrands < ActiveRecord::Migration[7.0]
  def change
    rename_column :car_brands, :brand_name, :name
  end
end
