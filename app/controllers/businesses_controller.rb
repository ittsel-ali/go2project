class BusinessesController < ApplicationController
  
  def index
  	@business_cats = current_user.business_categories || []
  	@business = Business.new
  end

  def edit
    @business = current_user.businesses.where(id: params[:id]).first
  end

  def create
  	@business = current_user.businesses.build(permit_business_attributes)
  	
    if @business.save
      flash[:success] = I18n.t 'resource_creation', resource: @business.class.table_name.singularize.titleize
    else
      flash[:error] = @business.errors.full_messages.to_sentence
    end
    
    redirect_to businesss_path
  end

  def update
    @business = Business.find(params[:id])

    if @business.update(permit_business_attributes)
      flash[:success] = I18n.t 'resource_updation', resource: @business.class.table_name.singularize.titleize
    else
      flash[:error] = @business.errors.full_messages.to_sentence
    end
    
    redirect_to businesss_path
  end


  protected

  def permit_business_attributes
  	params.require(:business).permit(:business_name, 
  		:person_name, :email, :cell, :office_phone, :fax, :address, :business_category_id)
  end
end
