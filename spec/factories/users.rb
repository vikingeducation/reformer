require 'faker/internet'

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email { Faker::Internet.safe_email }
  end
end
