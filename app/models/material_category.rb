class MaterialCategory < ApplicationRecord
  belongs_to :user
  has_many :materials

  def resources
	materials	  	
  end
end
