class ProjectTasksController < ApplicationController
  before_action :find_project, only: :create

  def create
    @task = @project.project_tasks.build(permit_params)
    
    if @task.save
      flash[:success] = I18n.t 'resource_creation', resource: @task.class.table_name.singularize.titleize
    else
      flash[:error] = @task.errors.full_messages.to_sentence
    end
    
    redirect_to project_path(@project)
  end

  def create_sub_tasks
    @task = @project.project_tasks.find(permit_params)
  end

  
  protected

  def find_project
    @project = current_user.projects.where(id: params[:project_id]).first
  end

  def permit_params
    params.require(:project_task).permit(:name, project_sub_task: [])
  end
end
