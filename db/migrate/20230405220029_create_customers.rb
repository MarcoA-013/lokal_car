class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.datetime :birth_date

      t.timestamps
    end
  end
end
