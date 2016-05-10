class User < ActiveRecord::Base
  validates :username,
            :presence => true,
            :uniqueness => true,
            :length => {
              :minimum => 8,
              :maximum => 32
            }

  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => /@/

  validates :password,
            :presence => true,
            :length => {
              :minimum => 8,
              :maximum => 32
            }
end
