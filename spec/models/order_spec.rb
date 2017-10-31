require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with shipping and billing addresses and a credit card' do
    order = build :order
    expect(order).to be_valid
  end

  it 'can tell you the product total' do
    prod1 = create(:product, price: 4.0)
    prod2 = create(:product, price: 2.0)
    order = create :order

    order.contents.create [
                           { product_id: prod1.id, quantity: 2 },
                           { product_id: prod2.id }
                         ]
    expected_total = (2 * prod1.price) + prod2.price

    expect(order.total).to eq expected_total.to_f
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
