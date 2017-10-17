class User < ApplicationRecord
  validates :username, :email, :password, presence: true

  def joined_on
    created_at.strftime "%Y-%m-%d"
  end
end
