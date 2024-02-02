class Car < ApplicationRecord
  before_validation :set_defaults
  
  private  def set_defaults
    status = 0 if status.blank?
  end
  
  enum status: { liberado: '0', locado: '2' }
  has_one_attached :image
  belongs_to :brand
  belongs_to :model

end
