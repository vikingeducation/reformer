class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true

  def joined_on
    created_at.strftime "%Y-%m-%d"
  end
end
