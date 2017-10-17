class State < ApplicationRecord
  has_many :cities
  has_many :addresses

  validates :abbrev, presence: true, uniqueness: true
end