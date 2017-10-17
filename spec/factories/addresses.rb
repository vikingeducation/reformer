require 'faker/address'

FactoryGirl.define do
  factory :address do
    street_1 { Faker::Address.street_address }
    post_code { Faker::Address.postcode }

    city
    state_id { city.state.id }
  end
end
