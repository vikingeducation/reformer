class Order < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card

  belongs_to :shipping_address,
             class_name: 'Address',
             foreign_key: :shipping_id

  belongs_to :billing_address,
             class_name: 'Address',
             foreign_key: :billing_id

  has_many :contents, class_name: 'OrderContent',
           foreign_key: :order_id, dependent: :destroy
  has_many :products, through: :contents

  validate :can_only_have_one_unplaced_order

  accepts_nested_attributes_for :contents, reject_if: :all_blank,
                                allow_destroy: true

  scope :placed, -> { where.not(checkout_date: nil) }
  scope :unplaced, -> { where(checkout_date: nil)}

  def placed?
    checkout_date.present?
  end

  def total
    products.sum('quantity * price')
  end

  private

  def can_only_have_one_unplaced_order
    if attributes['checkout_date'].nil?
      unplaced_orders = user.orders.reject(&:placed?)

      if unplaced_orders.any?
        errors.add(:user, "can't have more than one unplaced order")
      end
    end
  end
end
