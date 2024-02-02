class Brand < ApplicationRecord
  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      p row.to_hash
      Brand.create! row.to_hash
    end
  end
  has_many :cars, class_name: "Car", inverse_of: :brand
  accepts_nested_attributes_for :cars, reject_if: :all_blank
end
