require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with shipping and billing addresses and a credit card' do
    order = build :order
    expect(order).to be_valid
  end

  describe 'number of unplaced orders per user' do
    it 'is invalid unless it is the only one' do
      user = User.first
      create :order, checkout_date: nil, user: user
      # expect(user.reload.orders.size).to be 1

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
