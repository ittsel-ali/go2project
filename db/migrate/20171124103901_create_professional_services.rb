class CreateProfessionalServices < ActiveRecord::Migration[5.1]
  def change
    create_table :professional_services do |t|
      t.string :business_name
      t.string :person_name
      t.string :email  
      t.string :cell
      t.string :office_phone
      t.string :fax
      t.string :address

      t.references :user
      t.references :professional_service_category
      t.timestamps
    end
  end
end
