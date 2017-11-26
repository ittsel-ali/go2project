module SharedAssociations
  extend ActiveSupport::Concern

  included do 
    has_many :expenses, as: :expensable
    belongs_to :user
  	
  	validates :business_name, presence: true
  end
end