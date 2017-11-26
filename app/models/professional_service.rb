class ProfessionalService < ApplicationRecord
  include SharedAssociations
  
  belongs_to :professional_service_category

  def category_key
  	"professional_service_category"
  end
end
