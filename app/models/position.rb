class Position < ApplicationRecord

  # Validations for the Position model
  validates :description, presence: true

  # Relationships for the Position model
  has_many :employees, class_name: "employee", inverse_of: :position
  accepts_nested_attributes_for :employees, reject_if: :all_blank

  # Import CSV file into the Customer model (table)
  def self.import(file)
    CSV.foreach(file.path, col_sep: "\t", headers: true) do |row|
      print row.to_hash 


      if Position.find_by_id(row.to_hash['id'].to_i)
        Position.find_by_id(row.to_hash['id'].to_i).update row.to_hash
      else
        Position.create! row.to_hash
      end
    end
  end

end
