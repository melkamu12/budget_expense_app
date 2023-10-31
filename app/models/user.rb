class User < ApplicationRecord

    has_many :categories
    has_many :expenses

    validates :name, presence: true, allow_blank: false, length: { minimum: 2, maximum: 30 }

end
