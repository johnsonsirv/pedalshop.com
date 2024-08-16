class ProductPart < ApplicationRecord
  belongs_to :product
  belongs_to :part

  has_many :product_part_options

  validates :product_id, presence: true
  validates :part_id, presence: true
end