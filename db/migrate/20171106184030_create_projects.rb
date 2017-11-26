class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string  :project_name
      t.string  :project_number   
      t.string  :project_address
      t.string  :description_of_project
      t.string  :project_manager_name
      t.string  :project_manager_cell_number
      t.string  :project_manager_email_address
        
      
      t.references :user

      t.references :client
      t.references :staff 

      t.references :project_category
      t.references :project_sub_category
      
      t.timestamps
    end
  end
end
