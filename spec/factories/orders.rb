FactoryGirl.define do
  factory :order do
    user

    after(:build) do |order|
      order.billing_address = create :address, user: order.user
      order.shipping_address = create :address, user: order.user
      order.credit_card = create :credit_card, user: order.user
    end
  end
end
