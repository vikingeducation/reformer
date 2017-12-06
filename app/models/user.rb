class User < ApplicationRecord
  validates :username, :email, :password, presence: true

  validates :username,
            uniqueness: true,
            length: {in: 1..15}

  validates :email,
            uniqueness: true,
            format: {with: /@/}

  validates :password, length: {in: 8..25}

end
