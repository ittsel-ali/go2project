class CreateProjectSubTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :project_sub_tasks do |t|
      t.references :project
      t.references :project_task

      t.string :name
      
      t.timestamps
    end
  end
end
