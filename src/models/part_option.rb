class PartOption < ApplicationRecord

  scope :parts_in_stock, -> { where(in_stock: true) }

  belongs_to :part
  has_many :product_part_options
  has_many :product_parts, through: :product_part_options

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :in_stock, inclusion: { in: [true, false] }
end