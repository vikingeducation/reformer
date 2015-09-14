class User < ActiveRecord::Base
  validates :username,:password, :email, :presence => true
end
