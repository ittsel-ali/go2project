class Business < ApplicationRecord
  include SharedAssociations
  
  belongs_to :business_category

  def category_key
  	"business_category"
  end
end
