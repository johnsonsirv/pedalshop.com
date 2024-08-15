class Part < ApplicationRecord
  belongs_to :product

  has_many :part_options, through: :product_part_options
end
