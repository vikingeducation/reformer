class User < ApplicationRecord

  validates :username, :email, :password, :presence => true
  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => /@/

end
