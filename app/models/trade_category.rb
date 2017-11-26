class TradeCategory < ApplicationRecord
  belongs_to :user
  has_many :trades

  def resources
	trades	  	
  end
end
