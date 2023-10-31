class Category < ApplicationRecord
    belongs_to :user
    has_many :ExpenseCategory, dependent: :destroy
    has_many :expenses, through: :ExpenseCategory
    validates :name, :icon, presence: true
end
