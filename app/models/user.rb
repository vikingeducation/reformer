class User < ActiveRecord::Base
  validates :username, :email, :password,
            :presence => true

  validates :email,
            :format => { :with => /@/ }

end
