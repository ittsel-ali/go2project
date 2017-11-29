class ProjectsController < ApplicationController
  before_action :find_project, only: :show
  before_action :set_project_category_param, only: :index

  def index
    @category = current_user.project_categories.where(name: @project_category_name).first
    @sub_cats = @category.try(:project_sub_categories) || []
    
    @active_tabe = [] << "active"
    
    @project_sub_cat = ProjectSubCategory.new
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
    
    if @project.project_sub_category_id.present?
      category = ProjectSubCategory.find(@project.project_sub_category_id).project_category
      
      @project.project_category_id = category.id
      @category_name = category.name
    end
    
    if @project.save
      flash[:success] = I18n.t 'resource_creation', resource: @project.class.table_name.singularize.titleize
    else
      flash[:error] = @project.errors.full_messages.to_sentence
    end
    
    redirect_to projects_path(project_cat: @category_name)
  end


  protected 
  
  def find_project
    @project = current_user.projects.where(id: params[:id]).first
  end

  def set_project_category_param
    @project_category_name = params[:project_cat] || current_user.project_categories.first.name
  end

  def permit_project_attributes
    params.require(:project).permit(:project_name, 
      :project_number, :project_address, :description_of_project, :client_id, :staff_id, :project_sub_category_id)
  end
end
