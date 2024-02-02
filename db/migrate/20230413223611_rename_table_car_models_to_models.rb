class RenameTableCarModelsToModels < ActiveRecord::Migration[7.0]
  def change
    rename_table :car_brands, :brands
  end
end
