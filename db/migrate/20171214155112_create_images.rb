class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :file
      t.string :image_type

      t.references :project

      t.timestamps
    end
  end
end
