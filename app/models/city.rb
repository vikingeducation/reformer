class City < ApplicationRecord
  belongs_to :state
  has_many :addresses

  validates :name, presence: true
end
