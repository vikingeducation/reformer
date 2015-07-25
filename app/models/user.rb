class User < ActiveRecord::Base
  validates :username
            :presence => true,
            :uniqueness => true,
            :length =>{ :in => 6..16 }
            :on => :create
            :message => "Not a valid username."

  validates :email
            :presence => true,
            :uniqueness => true,
            :length =>{ :in => 5..40 },
            :format => { :with => /@/ },
            :on => :create
            :message => "Not a valid email."

  validates :password
            :presence => true,
            :length =>{ :in => 6..40 },
            :on => :create
            :message => "Not a valid password."


end
