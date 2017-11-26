class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :project_categories
  has_many :project_sub_categories

  has_many :businesses
  has_many :business_categories

  has_many :staffs
  has_many :staff_categories

  has_many :trades
  has_many :trade_categories

  has_many :materials
  has_many :material_categories

  has_many :professional_services
  has_many :professional_service_categories   

  has_many :clients
  has_many :client_categories  

  after_create :import_resource_categories  

  def import_resource_categories
    cproject = project_categories.create(name: 'construction')
    cproject.project_sub_categories.create(name: 'residential', user_id: id)
    cproject.project_sub_categories.create(name: 'commercial', user_id: id)
    cproject.project_sub_categories.create(name: 'infrastructure', user_id: id)
    cproject.project_sub_categories.create(name: 'industrial', user_id: id)

    project_categories.create(name: 'engineering')
    project_categories.create(name: 'design & arafting')
    project_categories.create(name: 'management')


    client_categories.create(name: "builder")
    client_categories.create(name: "owner")
    client_categories.create(name: "contractor")
    client_categories.create(name: "sub contractor")

    professional_service_categories.create(name: "lawyer")
    professional_service_categories.create(name: "architect designer")
    professional_service_categories.create(name: "realter")
    professional_service_categories.create(name: "bankder")
    professional_service_categories.create(name: "structural engineer")

    material_categories.create(name: "flooring")
    material_categories.create(name: "drywall and mud tapping")
    material_categories.create(name: "paint")
    material_categories.create(name: "lumber")
    material_categories.create(name: "insulation")

    trade_categories.create(name: "excavation")
    trade_categories.create(name: "foundation")
    trade_categories.create(name: "framing")
    trade_categories.create(name: "insulation")
    trade_categories.create(name: "drywall and mud tapping")
    trade_categories.create(name: "paint")
    trade_categories.create(name: "ceiling texture")

    business_categories.create(name: "meals and travels")
    business_categories.create(name: "motor vehicle expenses")
    business_categories.create(name: "office supplies")
    business_categories.create(name: "marketing and advertisement")
    business_categories.create(name: "delivery, freight and express")

    staff_categories.create(name: "salaried employee")
    staff_categories.create(name: "contract employee")
    staff_categories.create(name: "hourly employee")
    staff_categories.create(name: "project based employee")
    staff_categories.create(name: "student employee")
  end
end
