class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :customization

  # Validations
  validates :customization_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  
  
  def price
    customization.total_price * quantity
  end
end