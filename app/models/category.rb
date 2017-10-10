class Category < ApplicationRecord
  include IdAvailable

  validates :name, presence: true, length: { in: 4..16 }
end
