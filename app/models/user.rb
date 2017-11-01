class User < ApplicationRecord
  #TODO: When orders are added, business logic says deleting user also deletes:
  # - shopping cart
  has_many :addresses
  has_many :orders
  has_many :cards, class_name: 'CreditCard', dependent: :destroy

  belongs_to :shipping_address,
             class_name: 'Address',
             foreign_key: :shipping_id,
             required: false

  belongs_to :billing_address,
             class_name: 'Address',
             foreign_key: :billing_id,
             required: false

  validates :first_name, :last_name, :email,
            presence: true,
            length: { in: 1..64 }

  validates :email,
            format: { with: /@/, message: 'must have an @ symbol' },
            uniqueness: true

  def cart
    orders.where(checkout_date: nil).first
  end

  def clear_shipping_or_billing_address(address)
    self.shipping_id = nil if address.id == shipping_id
    self.billing_id = nil if address.id == billing_id
    save
  end

  def most_recent_order
    orders.maximum('checkout_date').to_date
  end
end
