class BusinessCategory < ApplicationRecord
  belongs_to :user
  has_many :businesses

  def resources
	businesses	  	
  end
end
