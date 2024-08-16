# frozen_string_literal: true

# Helper Module
module OrdersHelper
  VALID_STATUS = {
    pending: "pending",
    completed: "completed" ,
    cancelled: "cancelled"
  }.freeze
end
