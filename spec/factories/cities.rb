FactoryGirl.define do
  factory :city do
    name { Faker::Address.city }
    state { State.all.sample }
  end
end
