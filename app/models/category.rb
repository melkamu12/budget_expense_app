class Category < ApplicationRecord
  belongs_to :user
  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories
  validates :name, :icon, presence: true
  ICON_OPTIONS = ['🍔', '🛒', '🚗', '🐶', '📚', '💻', '🎁', '🏠', '🏥', '🎬', '👔', '🎓', '✈️', '⚽️', '🎮', '🎧', '🎸', '🎨', '🎥',
                  '💰', '🏆', '☎️', '📧', '🌍', '👫', '👪'].freeze
end
