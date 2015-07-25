class User < ActiveRecord::Base
  validates :username,
            :presence => {:message => "User name can't be blank." },
            :uniqueness => {:message => "User name already exists."},
            :length => { :in => 4..16 },
            :on => :create

  validates :email,
            :presence => {:message => "Email can't be blank." },
            :uniqueness => {:message => "Email is already registered."},
            :length => { :in => 5..40 },
            :format => { :with => /@/ },
            :on => :create

  validates :password,
            :presence => true,
            :length => { :in => 6..40 },
            :on => :create


end
