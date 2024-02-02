class Location < ApplicationRecord
  belongs_to :customer
  belongs_to :car
  belongs_to :employee
end
