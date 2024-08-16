class Customization < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :order_items

  # Validations
  validates :user_id, presence: true
  validates :product_id, presence: true
  validate :validate_configuration

  

  def validate_configuration
    # Add logic to validate the configuration against possible prohibitions
    # E.g., check if the selected options are valid together
  end
end