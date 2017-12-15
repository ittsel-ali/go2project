class ProjectTask < ApplicationRecord
  has_many  :project_sub_tasks
  belongs_to  :project

  accepts_nested_attributes_for :project_sub_tasks
end
