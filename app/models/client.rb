class Client < ApplicationRecord
  belongs_to :client_category
  has_one :project

  validates :business_name, presence: true
  
  def category_key
  	"client_category"
  end
end
