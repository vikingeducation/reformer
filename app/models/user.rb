class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :username, length: { minimum: 2}
end
