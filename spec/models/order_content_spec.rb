require 'rails_helper'

RSpec.describe OrderContent, type: :model do
  it 'has a default quantity' do
    oc = build :order_content
    expect(oc.quantity).to eq 1
  end

  it 'is invalid without quantity as a number' do
    oc = build :order_content, quantity: ''
    oc.valid?
    expect(oc.errors[:quantity]).to include "is not a number"
  end
end
