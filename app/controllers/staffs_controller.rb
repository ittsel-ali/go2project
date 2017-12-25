class StaffsController < ApplicationController
  
  def index
  	@staff_cats = current_user.staff_categories || []
  	@staff = Staff.new
  end

  def edit
    @staff = current_user.staffs.where(id: params[:id]).first
  end

  def create
  	@staff = current_user.staffs.build(permit_staff_attributes)

    if @staff.save
      flash[:success] = I18n.t 'resource_creation', resource: @staff.class.table_name.singularize.titleize
    else
      flash[:error] = @staff.errors.full_messages.to_sentence
    end
    
    redirect_to staffs_path
  end

  def update
    @staff = Staff.find(params[:id])

    if @staff.update(permit_staff_attributes)
      flash[:success] = I18n.t 'resource_updation', resource: @staff.class.table_name.singularize.titleize
    else
      flash[:error] = @staff.errors.full_messages.to_sentence
    end
    
    redirect_to staffs_path
  end


  protected

  def permit_staff_attributes
  	params.require(:staff).permit(:business_name, 
  		:person_name, :email, :cell, :office_phone, :fax, :address, :staff_category_id)
  end
end
