module Orders
  class Order < ApplicationRecord

    scope :current_browsing_order, ->(user_id) { where(user_id: user_id, status:  VALID_STATUS[:pending]) }
  
    belongs_to :user
    has_many :order_items, dependent: :destroy
  
    before_validation :generate_order_number, on: [:create]
  
    validates :order_number, presence: true, uniqueness: true
    validates :user_id, presence: true
    validates :status, inclusion: { in: VALID_STATUS.keys.map(&:to_s), allow_nil: false }
  
    def self.find_or_create_pending!(user)
      current_browsing_order = current_browsing_order(user.id).first
  
      return current_browsing_order if current_browsing_order
  
      create(user: user, status: VALID_STATUS[:pending])
    end
  
    private
  
    def generate_order_number
      self.order_number ||= SecureRandom.hex(10).upcase
    end
  end
end
