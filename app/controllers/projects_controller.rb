class ProjectsController < ApplicationController
  before_action :find_project, only: :show
  
  def index
    @sub_cats = current_user.project_categories.where(name: params[:project_cat]).try(:first).try(:project_sub_categories) || []
    @active_tabe = [] << "active"
  end

  def show
  end

  def new
    @project = Project.new

    @clients = current_user.clients
    @staffs = current_user.staffs
  end

  def create
    @project = current_user.projects.build(permit_project_attributes)
    
    if @project.valid?
      @project.project_category_id = ProjectSubCategory.find(@project.project_sub_category_id).project_category.id
    end
    
    if @project.save
      flash[:success] = I18n.t 'resource_creation', resource: @project.class.table_name.singularize.titleize
    else
      flash[:error] = @project.errors.full_messages.to_sentence
    end
    
    redirect_to projects_path
  end


  protected 
  
  def find_project
    @project = current_user.projects.where(id: params[:id]).first
  end

  def permit_project_attributes
    params.require(:project).permit(:project_name, 
      :project_number, :project_address, :description_of_project, :client_id, :staff_id, :project_sub_category_id)
  end
end
