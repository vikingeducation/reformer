require 'rails_helper'

RSpec.describe User, type: :model do
  let(:max_name_length) { 64 }

  it 'is invalid without first_name' do
    user = build :user, first_name: nil
    user.save
    expect(user.errors[:first_name]).to include "can't be blank"
  end

  it 'is invalid when first name is too long' do
    user = build :user, first_name: 'S' * (max_name_length + 1)
    expect(user).not_to be_valid
  end

  it 'is invalid without last_name' do
    user = build :user, last_name: nil
    user.save
    expect(user.errors[:last_name]).to include "can't be blank"
  end

  it 'is invalid when last name is too long' do
    user = build :user, last_name: 'S' * (max_name_length + 1)
    expect(user).not_to be_valid
  end

  it 'is invalid without email' do
    user = build :user, email: nil
    user.save
    expect(user.errors[:email]).to include "can't be blank"
  end

  it 'is invalid when email is missing an @' do
    user = build :user, email: 'bad.com'
    user.save
    expect(user.errors[:email]).to include 'must have an @ symbol'
  end

  it 'is invalid if email exists' do
    dup_email = 'tester@example.com'
    create :user, email: dup_email

    user = build :user, email: dup_email
    user.save
    expect(user.errors[:email]).to include 'has already been taken'
  end

end
