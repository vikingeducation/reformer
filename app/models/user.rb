class User < ActiveRecord::Base
  validates :username,
            :presence => {:message => "User name can't be blank." },
            :uniqueness => {:message => "User name already exists."},
            :length => { :in => 4..16 }

  validates :email,
            :presence => {:message => "Email can't be blank." },
            :uniqueness => {:message => "Email is already registered."},
            :length => { :in => 5..40 },
            :format => { :with => /@/ }

  validates :password,
            :presence => {:message => "Password can't be blank."},
            :length => { :in => 6..40 }


end
