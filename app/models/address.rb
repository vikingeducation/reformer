class Address < ApplicationRecord
  belongs_to :city
  belongs_to :state

  has_many :user_addresses
  has_many :users, through: :user_addresses
end
