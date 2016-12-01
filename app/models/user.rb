class User < ApplicationRecord

	validates :username, :email, :password, presence: { message: "must be given please" }

end
