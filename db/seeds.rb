# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cproject = ProjectCategory.create(name: 'construction')
cproject.project_sub_categories.create(name: 'residential')
cproject.project_sub_categories.create(name: 'commercial')
cproject.project_sub_categories.create(name: 'infrastructure')
cproject.project_sub_categories.create(name: 'industrial')

ProjectCategory.create(name: 'engineering')
ProjectCategory.create(name: 'design & arafting')
ProjectCategory.create(name: 'management')


ClientCategory.create(name: "builder")
ClientCategory.create(name: "owner")
ClientCategory.create(name: "contractor")
ClientCategory.create(name: "sub contractor")

ProfessionalServiceCategory.create(name: "lawyer")
ProfessionalServiceCategory.create(name: "architect designer")
ProfessionalServiceCategory.create(name: "realter")
ProfessionalServiceCategory.create(name: "bankder")
ProfessionalServiceCategory.create(name: "structural engineer")
