class Client < ApplicationRecord
  include SharedAssociations

  belongs_to :client_category
  has_one :project
  
  def category_key
  	"client_category"
  end
end
