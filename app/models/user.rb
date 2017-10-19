class User < ApplicationRecord
  #TODO: When orders are added, business logic says deleting user also deletes:
  # - shopping cart
  # - credit card
  has_many :user_addresses
  has_many :addresses, through: :user_addresses

  validates :first_name, :last_name, :email,
            presence: true,
            length: { in: 1..64 }

  validates :email,
            format: { with: /@/, message: 'must have an @ symbol' },
            uniqueness: true

end
