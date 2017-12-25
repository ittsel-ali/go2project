class AddPstToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :pst, :integer
  end
end
