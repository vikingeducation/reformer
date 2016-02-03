class User < ActiveRecord::Base

  validates :username, :email, :password,

            :presence => true, 
            :uniqueness => true,
            :length =>{ 
                      :in => 1..40, # same as above
            }

  validates :email,
            :format => { :with => /@/ }

end
