require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is invalid without a city' do
    bad_address = build :address, city: nil, state_id: 1
    bad_address.save
    expect(bad_address.errors[:city]).to include 'must exist'
  end

  it 'is invalid without a state' do
    bad_address = build :address, state_id: nil
    bad_address.save
    expect(bad_address.errors[:state]).to include 'must exist'
  end

  it 'is invalid without a street address' do
    bad_address = build :address, street_1: nil
    bad_address.save
    expect(bad_address.errors[:street_1]).to include "can't be blank"
  end

  it 'is invalid when street address is too long' do
    bad_address = build :address, street_1: 'a' * 65
    expect(bad_address).not_to be_valid
  end
end
