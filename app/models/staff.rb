class Staff < ApplicationRecord
  include SharedAssociations
  
  belongs_to :staff_category
  has_one :project

  def category_key
  	"staff_category"
  end
end
