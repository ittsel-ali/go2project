class Expense < ApplicationRecord
  belongs_to :expensable, polymorphic: true
end
