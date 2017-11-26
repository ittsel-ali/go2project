class MaterialsController < ApplicationController
  
  def index
  	@material_cats = current_user.material_categories || []
  	@material = Material.new
  end

  def create
  	@material = current_user.materials.build(permit_material_attributes)

    if @material.save
      flash[:success] = I18n.t 'resource_creation', resource: @material.class.table_name.singularize.titleize
    else
      flash[:error] = @material.errors.full_messages.to_sentence
    end
    
    redirect_to materials_path
  end


  protected

  def permit_material_attributes
  	params.require(:material).permit(:business_name, 
  		:person_name, :email, :cell, :office_phone, :fax, :address, :material_category_id)
  end
end
