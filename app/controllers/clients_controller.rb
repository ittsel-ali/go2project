class ClientsController < ApplicationController
  def index
  	@client_cats = current_user.client_categories || []
  	@client = Client.new
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


  protected

  def permit_client_attributes
  	params.require(:client).permit(:business_name, 
  		:person_name, :email, :cell, :office_phone, :fax, :address, :client_category_id)
  end
end
