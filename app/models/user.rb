class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
end
