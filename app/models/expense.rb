class Expense < ApplicationRecord
  belongs_to :expensable, polymorphic: true

  belongs_to :project
  belongs_to :project_task
  belongs_to :project_sub_task

end
