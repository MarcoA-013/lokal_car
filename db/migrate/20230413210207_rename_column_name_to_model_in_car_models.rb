class RenameColumnNameToModelInCarModels < ActiveRecord::Migration[7.0]
  def change
    rename_column :car_models, :name, :model
  end
end
