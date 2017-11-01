class OrderContent < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: :only_integer
  validates :product_id, uniqueness: {
    scope: :order_id,
    message: "can't be added more than once"
  }
end
