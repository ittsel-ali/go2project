class ProjectSubCategoriesController < ApplicationController
  
  def create
    @category = current_user.project_categories.where(id: permit_params[:project_category_id]).first
    @sub_category = @category.project_sub_categories.build(permit_params)    
    
    if @sub_category.save
      flash[:success] = I18n.t 'resource_creation', resource: @sub_category.class.table_name.singularize.titleize
    else
      flash[:error] = @sub_category.errors.full_messages.to_sentence
    end
    
    redirect_to projects_path(project_cat: @category.name)
  end

protected 

  def permit_params
    params.require(:project_sub_category).permit(:name, :project_category_id).merge(user_id: current_user.id)
  end
end
