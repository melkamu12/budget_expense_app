require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense model' do
    let(:user) { User.create(name: 'John Doe', email: 'john@example.com') }
    let(:expense) { Expense.new(id: 1, name: 'games', amount: 100, author_id: user.id) }

    it 'should have an integer author_id' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.author_id = nil
      expect(expense).to_not be_valid
    end

    it 'name should be presence' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.name = nil
      expect(expense).to_not be_valid
    end

    it 'amount should be greater than or equal to zero' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.amount = -1
      expect(expense).to_not be_valid
    end

    it 'category_ids should be present' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.category_ids = nil
      expect(expense).to_not be_valid
      expect(expense.errors[:category_ids]).to include('must be selected')
    end
    it 'is associated with an author (User)' do
      expense = Expense.new(
        name: 'food',
        amount: 50.0,
        author: user
      )
      expect(expense.author).to eq(user)
    end
  end
end
