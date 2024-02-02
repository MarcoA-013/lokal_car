class RenameTableCarBrandsToBrands < ActiveRecord::Migration[7.0]
  def change
    rename_table :car_models, :models
  end
end
