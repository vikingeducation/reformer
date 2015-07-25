class User < ActiveRecord::Base
  validates :username, :email, :password, :presence => true
  validates :password, 
            :presence => {:message => "Password can't be blank"},
            :length => {:within => 6..32}
  validates :email, 
            :presence => {:message => "User name can't be blank"},
            :format => {:with => /@/}
end
