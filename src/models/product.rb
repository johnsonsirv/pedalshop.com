class Product < ApplicationRecord
  belongs_to :category

  has_many :parts, through: :product_parts
  has_many :customizations
end