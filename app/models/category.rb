class Category < ApplicationRecord
  include IdAvailable

  has_many :products

  validates :name, presence: true, length: { in: 4..16 }

end
