class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.float :total
      t.references :customer, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
