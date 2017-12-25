class ProfessionalServicesController < ApplicationController

  def index
    @professional_service_cats = current_user.professional_service_categories || []
    @professional_service = ProfessionalService.new
  end

  def edit
    @professional_service = current_user.professional_services.where(id: params[:id]).first
  end

  def create
  	@professional_service = current_user.professional_services.build(permit_professional_service_attributes)
  	
    if @professional_service.save
      flash[:success] = I18n.t 'resource_creation', resource: @professional_service.class.table_name.singularize.titleize
    else
      flash[:error] = @professional_service.errors.full_messages.to_sentence
    end
    
    redirect_to professional_services_path
  end

  def update
    @professional_service = ProfessionalService.find(params[:id])

    if @professional_service.update(permit_professional_service_attributes)
      flash[:success] = I18n.t 'resource_updation', resource: @professional_service.class.table_name.singularize.titleize
    else
      flash[:error] = @professional_service.errors.full_messages.to_sentence
    end
    
    redirect_to professional_services_path
  end


  protected

  def permit_professional_service_attributes
  	params.require(:professional_service).permit(:business_name, 
  		:person_name, :email, :cell, :office_phone, :fax, :address, :professional_service_category_id)
  end
end
