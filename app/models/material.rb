class Material < ApplicationRecord
  include SharedAssociations
	
	belongs_to :material_category

  def category_key
  	"material_category"
  end
end
