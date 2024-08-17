# Will inherit from ActiveController::Base in Rails

class ApplicationController
  def current_browsing_user
    @current_browsing_user ||= current_user
  end

  private

  def current_user
    # Logic to find the authenticated user
  end
end
