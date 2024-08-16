class Part < ApplicationRecord
  scope :with_part_options, -> { includes(:part_options) }
  
  has_many :part_options
  has_many :product_parts
  has_many :products, through: :product_parts

  validates :name, presence: true
end
