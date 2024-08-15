class Customization < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :order_items
end