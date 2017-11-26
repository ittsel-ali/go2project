class CreateTradeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :trade_categories do |t|
      t.string :name 	 
      
      t.references :user
      t.timestamps
    end
  end
end
