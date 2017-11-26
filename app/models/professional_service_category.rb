class ProfessionalServiceCategory < ApplicationRecord
  belongs_to :user
  has_many :professional_services
  
  def resources
	professional_services	  	
  end
end
