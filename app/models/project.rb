class Project < ApplicationRecord
  belongs_to :user
  belongs_to :project_category
  belongs_to :project_sub_category
  belongs_to :client
  belongs_to :staff

  has_many :project_tasks
  has_many :project_sub_tasks, through: :project_tasks
  has_many :images

  has_many :images, as: :imagable

  validates :project_name, presence: true

  accepts_nested_attributes_for :project_tasks

  after_save :construction_tasks

  def construction_tasks
    puts self.project_category.name
    if self.project_category.name == "construction"
      self.project_tasks.create(
        [ 
          {name: "Land Aquisition"},
          {name: "Professional Services", project_sub_tasks_attributes: [{name: "Lawyer's services"}]},
          {name: "Design & Engineering", project_sub_tasks_attributes: [
            {name: "Architectural Design"},
            {name: "Structural Engineering"},
            {name: "Interior Design"},
            {name: "Rendering Services"},
            {name: "Landscaping Design"},
            {name: "Site Grading Design"}
          ]},
          {name: "Permit Applications", project_sub_tasks_attributes: [
            {name: "Ventialtion Rerport"},
            {name: "Permit Fee - Full House"},
            {name: "Permit Fee - Basement"},
            {name: "Permit Fee - Garage"},
            {name: "Permit Fee - Deck"},
            {name: "Grading Permit"},
            {name: "Electrical Permit"},
            {name: "Mechanical & Gas Permit"},
            {name: "Plumbing Permit"},
          ]},
          {name: "Foundation", project_sub_tasks_attributes: [
            {name: "All Concrete Work"},
            {name: "Surveyor"},
            {name: "Excavation"},
            {name: "Footing"},
            {name: "Weeping tile"},
          ]}
        ])
    end 
  end
end
