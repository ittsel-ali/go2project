class Expense < ApplicationRecord
  belongs_to :expensable, polymorphic: true

  belongs_to :project
  belongs_to :project_task
  belongs_to :project_sub_task

  has_one :image, as: :imagable, validate: false

  accepts_nested_attributes_for :image

end
