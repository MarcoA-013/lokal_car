class Customer < ApplicationRecord
  require 'csv'

  # Validations for the Customer model
  validates :name, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :birth_date, presence: true

  # Import CSV file into the Customer model (table)
  def self.import(file)
    CSV.foreach(file.path, col_sep: "\t", headers: true) do |row|
      if Customer.find_by_id(row.to_hash['id'].to_i)
        Customer.find_by_id(row.to_hash['id'].to_i).update row.to_hash
      else
        Customer.create! row.to_hash
      end
    end
  end
end


  

  


