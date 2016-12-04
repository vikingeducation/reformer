class User < ApplicationRecord
  # validates :username, presence: true
  # validates :email, presence: true
  # validates :password, presence: true

  validates :username, :email, :password, presence: true

end
