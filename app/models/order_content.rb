class OrderContent < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: :only_integer
end
