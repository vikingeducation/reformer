require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with name, price, and category' do
    prod = build :product, category_id: 1
    expect(prod).to be_valid
  end

  it 'is invalid without name' do
    prod = build :product, name: nil
    prod.valid?
    expect(prod.errors[:name]).to include "can't be blank"
  end

  it 'is invalid without price' do
    prod = build :product, price: nil
    prod.valid?
    expect(prod.errors[:price]).to include "can't be blank"
  end

  it 'is invalid without category_id' do
    prod = build :product, category_id: nil
    prod.valid?
    expect(prod.errors[:category_id]).to include "can't be blank"
  end

  it 'is invalid if price is over 10 thousand dollars' do
    prod = build :product, price: 10001.00
    prod.valid?
    expect(prod.errors[:price]).to include 'must be less than or equal to 10000'
  end

  it 'removes dollar signs from price before validating' do
    prod = build :product, price: '$2.00', category_id: 1
    expect(prod).to be_valid
  end
end
