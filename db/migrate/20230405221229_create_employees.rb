class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.datetime :contract_date
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
