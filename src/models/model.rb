class User < ApplicationRecord
  has_many :orders
  has_many :customizations
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
end

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :customization
end

class Category < ApplicationRecord
  has_many :products
end

class Product < ApplicationRecord
  belongs_to :category

  has_many :parts, through: :product_parts
  has_many :customizations
end

class Part < ApplicationRecord
  belongs_to :product

  has_many :part_options, through: :product_part_options
end

class PartOption < ApplicationRecord
  belongs_to :part
end

class ProductPart < ApplicationRecord
  belongs_to :product
  belongs_to :part
end

class ProductPartOption < ApplicationRecord
  belongs_to :product_part
  belongs_to :part_option
end

class Customization < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :order_items
end

class PartOptionCombination < ApplicationRecord
end

class PartOptionProhibition < ApplicationRecord
end