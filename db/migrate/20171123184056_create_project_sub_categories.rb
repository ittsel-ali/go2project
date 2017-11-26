class CreateProjectSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :project_sub_categories do |t|
      t.string :name

      t.references :project_category
      t.references :user
      t.timestamps
    end
  end
end
