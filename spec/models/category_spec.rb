require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  before { user.save }

  let(:category) { Category.new(id: 1, name: 'online', icon: '🍔', user: user) }
  before { category.save }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(
      icon: 'FoodIcon'
    )
    expect(category).not_to be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(
      name: 'Food'
    )
    expect(category).not_to be_valid
  end

  it 'is associated with a user' do
    category = Category.new(
      name: 'Food',
      icon: 'FoodIcon',
      user:
    )
    expect(category.user).to eq(user)
  end
end