class CheckoutController < ApplicationController
  before_action :current_browsing_user
  
  def start_checkout
    @checkout = CheckoutService
      .new(current_browsing_order, current_browsing_user)
      .start_checkout

    return proceed_to_payment if @checkout.success?

    # handle failure
  end

  def process_payment
    # CheckoutService
    #   .new(current_browsing_order, current_browsing_user)
    #   .process_payment(payment_info)
  end

  def complete_order
    # CheckoutService
    #   .new(current_browsing_order, current_browsing_user)
    #   .complete_order(payment_info)
  end

  private

  def proceed_to_payment
    # redirect to payment
  end
end
