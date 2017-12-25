class ClientsController < ApplicationController
  def index
  	@client_cats = current_user.client_categories || []
  	@client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
  	@client = current_user.clients.build(permit_client_attributes)

    if @client.save
      flash[:success] = I18n.t 'resource_creation', resource: @client.class.table_name.singularize.titleize
    else
      flash[:error] = @client.errors.full_messages.to_sentence
    end
    
    redirect_to clients_path
  end

  def update
    @client = current_user.clients.find(params[:id])
    
    if @client.update(permit_client_attributes)
      flash[:success] = I18n.t 'resource_updation', resource: @client.class.table_name.singularize.titleize
    else
      flash[:error] = @client.errors.full_messages.to_sentence
    end
    
    redirect_to edit_clients_path(params[:id])
  end


  protected

  def permit_client_attributes
  	params.require(:client).permit(:business_name, 
  		:person_name, :email, :cell, :office_phone, :fax, :address, :client_category_id)
  end
end
