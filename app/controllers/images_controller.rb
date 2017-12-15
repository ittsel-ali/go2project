class ImagesController < ApplicationController

	def create
		@image = Image.new(permit_params)
		
		if @image.save
      flash[:success] = I18n.t 'resource_creation', resource: @image.class.table_name.singularize.titleize
    else
      flash[:error] = @image.errors.full_messages.to_sentence
    end
    
    redirect_to project_path(permit_params[:project_id])
	end

	private 

	def permit_params
		params.require(:image).permit(:file, :project_id, :image_type)
	end
end
