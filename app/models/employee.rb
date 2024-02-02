class Employee < ApplicationRecord
  belongs_to :position
  # import method
  def self.import(file)
    CSV.foreach(file.path, headers: true, col_sep:"\t") do |row|
      Employee.create! row.to_hash
    end
  end
  # export method
  def self.to_csv
    attributes = %w{id name lastname email phone address position_id created_at updated_at}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |employee|
        csv << employee.attributes.values_at(*attributes)
      end
    end
  end
  # search method
  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      all
    end
  end
  
end
