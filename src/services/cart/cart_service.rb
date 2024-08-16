class CartService
  def initialize(user)
    @user = user
  end

  def add_to_cart(product, configurations, total_price)
    params = customization_params(product, configurations, total_price)

    ActiveRecord::Base.transaction do
      customization = Customization.create!(params)

      pending_order = Order.find_or_create_pending!(user: @user)
      pending_order.order_items.create!(customization: customization)
    end
  end

  def remove_from_cart(cart_item)
    # logic to fetch order item by id
    # remove item and customization
    # return boolean
    # all atomic transactions
  end

  private

  def customization_params(product, configurations, total_price)
    # Typically from UI
    {
      user: @user,
      product_id: product,
      configurations: configurations,
      total_price: total_price # sum of all part_option prices (plus any combination specific pricing)
    }
  end
end