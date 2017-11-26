class CreateProjectTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :project_tasks do |t|
      t.references :project 	
      t.string :name
      t.timestamps
    end
  end
end
