require 'rails_helper'

RSpec.describe City, type: :model do
  it 'is invalid without a name' do
    city = build :city, name: nil
    city.valid?
    expect(city.errors[:name]).to include "can't be blank"
  end

  it 'is invalid when name is more than 64 characters' do
    city = build :city, name: 'a' * 65
    expect(city).not_to be_valid
  end
end
