class User < ApplicationRecord
  validates :email, :username, :password,
    :presence => true
  validates :password, :length => {:in => 8..16}
  validates :username, :format => {without: /\s/ }
end
