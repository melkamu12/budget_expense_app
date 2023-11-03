require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  let(:user) { User.create(id: 1, name: 'John Doe', email: 'john@example.com', password: 'password') }
  before { user.save }

  let(:category) { Category.new(id: 1, name: 'games', icon: '⚽️', user_id: user) }
  before { category.save }

  let(:expense) { Expense.new(id: 1, name: 'football', amount: 100, author_id: user.id) }
  before { expense.save }

  it 'is valid with valid attributes' do
    expense_category = ExpenseCategory.new(expense:, category:)
    expect(expense_category).to be_valid
  end

  it 'is associated with an expense' do
    expense_category = ExpenseCategory.new(
      expense:,
      category:
    )
    expect(expense_category.expense).to eq(expense)
  end

  it 'is associated with a category' do
    expense_category = ExpenseCategory.new(
      expense:,
      category:
    )
    expect(expense_category.category).to eq(category)
  end
end
