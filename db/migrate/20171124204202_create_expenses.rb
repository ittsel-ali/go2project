class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :payment_type
      t.string :payment_menthod
      t.string :amount
      
      t.references :project
      t.references :project_task
      t.references :project_sub_task
      
      t.references :user
      t.references :expensable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
