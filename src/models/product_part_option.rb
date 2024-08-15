class ProductPartOption < ApplicationRecord
  belongs_to :product_part
  belongs_to :part_option
end