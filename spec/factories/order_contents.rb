FactoryGirl.define do
  factory :order_content do
    order
    product
    quantity 1
  end
end
