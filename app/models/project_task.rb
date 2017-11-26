class ProjectTask < ApplicationRecord
  has_many  :project_sub_tasks
  belongs_to  :project
end
