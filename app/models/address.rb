class Address < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :user

  validates :street_1, presence: true,
            length: { maximum: 64 }

  validates :post_code, presence: true

  accepts_nested_attributes_for :city
end
