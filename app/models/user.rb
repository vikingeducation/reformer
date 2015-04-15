class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true, message: "please fill in all fields!"
  validates :username, length: { minimum: 5,
  too_short: "%{count} characters is the minimum allowed" }
  validates :username, length: { maximum: 60,
  too_long: "%{count} characters is the maximum allowed" }
  validates :email, format: { with: /@/ }, message: "Please add a valid email!"
  validates :password, length: { in: 6..20,
  too_short: "%{count} characters is the minimum allowed",
  too_long: "%{count} characters is the maximum allowed" }
end
