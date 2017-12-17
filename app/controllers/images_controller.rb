class ImagesController < ApplicationController

	def create
		@image = Image.new(permit_params)
			
		if @image.save
	      flash[:success] = I18n.t 'resource_creation', resource: @image.class.table_name.singularize.titleize
	    else
	      flash[:error] = @image.errors.full_messages.to_sentence
	    end
	    
	    redirect_to get_redirect_path(permit_params[:imagable_type], permit_params[:imagable_id])
	end

	private 

	def permit_params
		params.require(:image).permit(:file, :imagable_type, :imagable_id, :image_type)
	end

	def get_redirect_path(object_name, object_id)
		if permit_params[:imagable_type] == "Project"
			return project_path(object_id)
		
		elsif permit_params == "Expense"
			return new_expense_path(object_id)
		end
	end
end
