class ProductPartOption < ApplicationRecord
  belongs_to :product_part
  belongs_to :part_option

  # Validations
  validates :product_part_id, presence: true
  validates :part_option_id, presence: true
end