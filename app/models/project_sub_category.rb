class ProjectSubCategory < ApplicationRecord
  belongs_to :project_category
  belongs_to :user
  
  has_many :projects
end
