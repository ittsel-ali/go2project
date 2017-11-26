class ProjectCategory < ApplicationRecord
	belongs_to :user
	
	has_many :projects
	has_many :project_sub_categories
end
