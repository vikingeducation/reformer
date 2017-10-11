class Category < ApplicationRecord
  include IdAvailable

  validates :name, presence: true, length: { in: 4..16 }

  def products
    @products ||= Product.where category_id: id
  end
end
