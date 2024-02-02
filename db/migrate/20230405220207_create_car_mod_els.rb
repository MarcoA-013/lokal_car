class CreateCarModEls < ActiveRecord::Migration[7.0]
  def change
    create_table :car_mod_els do |t|
      t.string :name

      t.timestamps
    end
  end
end
