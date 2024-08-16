class User < ApplicationRecord
  has_many :orders
  has_many :customizations

  # validations go here
end