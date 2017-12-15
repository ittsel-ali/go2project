class ProjectSubTasksController < ApplicationController
  before_action :find_project, only: :create
  before_action :find_project_task, only: :create
  skip_before_action :verify_authenticity_token
  
  def create
    params[:project_sub_task].each do |k, v|
      @task.project_sub_tasks << ProjectSubTask.new(name: v[:name], project_id: @project.id)
    end
    
    if @task.save
      flash[:success] = I18n.t 'resource_creation', resource: @task.class.table_name.singularize.titleize
    else
      flash[:error] = @task.errors.full_messages.to_sentence
    end
    
    redirect_to project_path(@project)
  end

  
  protected

  def permit_params
    params.require(:project_sub_task).permit!
  end

  def find_project
    @project = current_user.projects.where(id: params[:project_id]).first
  end

  def find_project_task
    @task = @project.project_tasks.where(id: params[:project_task_id]).first
  end
end
