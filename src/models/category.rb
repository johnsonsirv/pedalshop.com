class Category < ApplicationRecord
  has_many :products

  # Validations
  validates :name, presence: true, uniqueness: true
end
