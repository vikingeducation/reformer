require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is invalid without name' do
    category = build :category, name: nil
    category.valid?
    expect(category.errors[:name]).to include "can't be blank"
  end

  it 'is invalid if name is fewer than 4 characters' do
    category = build :category, name: 'Doc'
    category.valid?
    expect(category.errors[:name])
      .to include 'is too short (minimum is 4 characters)'
  end

  it 'is invalid if name is more than 16 characters' do
    category = build :category, name: 'The Doctor Horrible'
    category.valid?
    expect(category.errors[:name])
      .to include 'is too long (maximum is 16 characters)'
  end
end
