class Product < ApplicationRecord
  include IdAvailable

  belongs_to :category

  validates :name, :price, :category_id, presence: true

  validates :price, numericality: { less_than_or_equal_to: 10000 }

  def price=(new_price)
    write_attribute(:price, new_price.to_s.delete('$')) unless new_price.nil?
  end
end
