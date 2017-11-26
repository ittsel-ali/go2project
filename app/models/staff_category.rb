class StaffCategory < ApplicationRecord
  belongs_to :user
  has_many :staffs

  def resources
	staffs	  	
  end
end
