FactoryGirl.define do
  factory :credit_card do
    user
    number "1234567890123456"
    expires "2017-10-24"
  end
end
