class City < ApplicationRecord
  has_many :addresses

  validates :name, presence: true,
            length: { maximum: 64 }
end
