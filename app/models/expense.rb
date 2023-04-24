class Expense < ApplicationRecord
    belongs_to :user
    has_many :group_expenses
    has_many :groups, through: :group_expenses
    validates :name, presence: true, length: { maximum: 50 }
    validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
