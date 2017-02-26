class User < ApplicationRecord
  validates :username, :email, :string, presence: true
end
