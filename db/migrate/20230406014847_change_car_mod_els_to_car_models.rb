class ChangeCarModElsToCarModels < ActiveRecord::Migration[7.0]
  def change
    rename_table :car_mod_els, :car_models
  end
end
