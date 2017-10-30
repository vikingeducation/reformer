require 'rails_helper'

RSpec.describe OrderContent, type: :model do
  it 'has a default quantity' do
    oc = build :order_content
    expect(oc.quantity).to eq 1
  end

  it 'is invalid without quantity as a number' do
    oc = build :order_content, quantity: ''
    oc.valid?
    expect(oc.errors[:quantity]).to include 'is not a number'
  end

  it 'ensures product is not duplicated' do
    oc = create :order_content
    bad_contents = build :order_content, product_id: oc.product_id, order_id: oc.order_id

    bad_contents.valid?
    expect(bad_contents.errors[:product_id]).to include "can't add product more than once"
  end
end
