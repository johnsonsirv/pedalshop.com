class PartOptionCombination < ApplicationRecord
  validates :part_options, presence: true
  validates :combination_price, numericality: { greater_than_or_equal_to: 1 }
end