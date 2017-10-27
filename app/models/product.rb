class Product < ApplicationRecord
  include IdAvailable

  belongs_to :category

  has_many :contents, class_name: 'OrderContent', foreign_key: :product_id
  has_many :orders, through: :contents

  validates :name, :price, :category_id, presence: true

  validates :price, numericality: { less_than_or_equal_to: 10000 }

  def price=(new_price)
    write_attribute(:price, new_price.to_s.delete('$')) unless new_price.nil?
  end
end
