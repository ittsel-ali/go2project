class ProjectsController < ApplicationController
  before_action :find_project, except: :index
  
  def index
    @sub_cats = current_user.project_categories.where(name: params[:project_cat]).try(:first).try(:project_sub_categories) || []
    @active_tabe = [] << "active"
  end

  def show
  end


  protected 
  
  def find_project
    @project = current_user.projects.where(id: params[:id])
  end
end
