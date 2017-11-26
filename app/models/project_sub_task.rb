class ProjectSubTask < ApplicationRecord
  belongs_to :project_task
  belongs_to :project
end
