class User < ApplicationRecord
  #TODO: When orders are added, business logic says deleting user also deletes:
  # - shopping cart
  # - credit card
  has_many :addresses

  belongs_to :shipping_address,
             class_name: 'Address',
             foreign_key: :billing_id,
             required: false

  belongs_to :billing_address,
             class_name: 'Address',
             foreign_key: :shipping_id,
             required: false

  validates :first_name, :last_name, :email,
            presence: true,
            length: { in: 1..64 }

  validates :email,
            format: { with: /@/, message: 'must have an @ symbol' },
            uniqueness: true

end
