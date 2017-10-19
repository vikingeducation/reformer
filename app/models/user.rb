class User < ApplicationRecord
  validates :first_name, :last_name, :email,
            presence: true,
            length: { in: 1..64 }

  validates :email, format: { with: /@/, message: 'must have an @ symbol' }

  def joined_on
    created_at.strftime "%Y-%m-%d"
  end
end
