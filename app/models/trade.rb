class Trade < ApplicationRecord
  include SharedAssociations
  
  belongs_to :trade_category

  def category_key
  	"trade_category"
  end
end
