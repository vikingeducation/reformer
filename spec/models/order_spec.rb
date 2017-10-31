require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with shipping and billing addresses and a credit card' do
    order = build :order
    expect(order).to be_valid
  end

  it 'can tell you the product total' do
    products = [
      create(:product, price: 4.0),
      create(:product, price: 2.0)
    ]

    order = create :order
    order.products = products

    expect(order.total).to eq 6.0
  end

  describe 'number of unplaced orders per user' do
    it 'is invalid unless it is the only one' do
      user = User.first
      create :order, checkout_date: nil, user: user

      new_order = user.reload.orders.build(
        credit_card_id: user.cards.first.id,
        billing_id: user.billing_address,
        shipping_id: user.shipping_address
      )

      new_order.valid?
      expect(new_order.errors[:user]).to include "can't have more than one unplaced order"
    end
  end
end
