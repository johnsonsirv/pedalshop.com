module Products
  class Product < ApplicationRecord
    belongs_to :category
    has_many :parts, through: :product_parts
    has_many :customizations
  
     validates :category_id, presence: true
     validates :name, description, presence: true
     validates :base_price, numericality: { greater_than_or_equal_to: 1 }
  
     def set_default_configuration(default_config)
      default_config.each do |c|
        product_part = Products::ProductPart.create!(product: self, part_id: c.part)
        Products::ProductPartOption.create!(product_part: product_part, part_option_id: c.part_option)
      end
    end
  end
end
