class Project < ApplicationRecord
  belongs_to :user
  belongs_to :project_category
  belongs_to :project_sub_category
  belongs_to :client
  belongs_to :staff

  has_many :project_tasks
  has_many :project_sub_tasks, through: :project_tasks
  has_many :images

  validates :project_name, presence: true

  accepts_nested_attributes_for :project_tasks
end
