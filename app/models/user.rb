class User < ActiveRecord::Base
  validates :username,
            :email,
            :presence => true
  validates :password,
           :presence => true,
           :if => lambda{ new_record? || password.nil? }
end
