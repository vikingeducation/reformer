class User < ActiveRecord::Base
  validates :user,:password, :email,
            :presence => true

end
