require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'requires a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'validates the name length' do
    subject.name = 'A' * 1 # Too short
    expect(subject).not_to be_valid

    subject.name = 'A' * 32 # Too long
    expect(subject).not_to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(
      email: 'john@example.com',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'has many expenses' do
    association = User.reflect_on_association(:expenses)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many categories' do
    association = User.reflect_on_association(:categories)
    expect(association.macro).to eq(:has_many)
  end
end
