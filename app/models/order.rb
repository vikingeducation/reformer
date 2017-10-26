class Order < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card

  belongs_to :shipping_address,
             class_name: 'Address',
             foreign_key: :shipping_id

  belongs_to :billing_address,
             class_name: 'Address',
             foreign_key: :billing_id

  validate :can_only_have_one_unplaced_order

  def placed?
    checkout_date.present?
  end

  private

  def can_only_have_one_unplaced_order
    user_orders = user.orders.select { |order| !order.placed? }

    if user_orders.any?
      errors.add(:user, "can't have more than one unplaced order")
    end
  end
end
