class CartController < ApplicationController
  before_action :current_browsing_user

  def add_to_cart(product, configurations, total_price)
    Cart::CartService.new(current_browsing_user).add_to_cart(product, configurations, total_price)
  end

  def remove_from_cart(cart_item)
    Cart::CartService.new(current_browsing_user).remove_from_cart(cart_item)
  end

  def modify_cart
    # Logic to modify cart
  end
end
