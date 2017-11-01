require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe 'number' do
    it 'is invalid without' do
      cc = build :credit_card, number: nil
      cc.valid?
      expect(cc.errors[:number]).to include "can't be blank"
    end

    it 'is invalid if not 16 digits' do
      cc = build :credit_card, number: '1234'
      cc.valid?
      expect(cc.errors[:number]).to include 'is the wrong length (should be 16 characters)'
    end

    it 'is invalid if it includes non-digits' do
      cc = build :credit_card, number: '123abc456'
      cc.valid?
      expect(cc.errors[:number]).to include 'is not a number'
    end
  end

  it 'is invalid if cv2 is not 3 digits' do
    cc = build :credit_card, cv2: 2334
    cc.valid?
    expect(cc.errors[:cv2]).to include 'is the wrong length (should be 3 characters)'
  end

  it 'is invalid without an expiration date' do
    cc = build :credit_card, expires: nil
    cc.valid?
    expect(cc.errors[:expires]).to include "can't be blank"
  end
end
