class User < ActiveRecord::Base

  validates :username, :email, :password, :presence => true
  validates :username, :length => {:within => 6..32}
  validates :password, :length => {:within => 6..32}
  validates :email, :format => {:with => /@/}
end
