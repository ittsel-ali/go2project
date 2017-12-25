class ExpensesController < ApplicationController
  def new
    @expense = Expense.new

    @professionals = current_user.professional_services
    @materials = current_user.materials
    @staffs = current_user.staffs
    @trades = current_user.trades
    @clients = current_user.clients

    @projects = Project.includes(:project_tasks, :project_sub_tasks)
  end

  def edit
    @expense = current_user.expenses.where(id: params[:id]).first
    
    @projects = Project.includes(:project_tasks, :project_sub_tasks)
    @project_tasks = @projects.find(@expense.project_id).project_tasks
    @project_sub_tasks = @project_tasks.where(id: @expense.project_task_id).first.project_sub_tasks
  end

  def create
    @expense = current_user.expenses.build(permit_params)  	

    if @expense.save
      flash[:success] = I18n.t 'resource_creation', resource: @expense.class.table_name.singularize.titleize
    else
      flash[:error] = @expense.errors.full_messages.to_sentence
    end
    
    redirect_to new_expense_path
  end

  def update
    @expense = current_user.expenses.find(params[:id])
       

    if @expense.update(permit_params)
      flash[:success] = I18n.t 'resource_updation', resource: @expense.class.table_name.singularize.titleize
    else
      flash[:error] = @expense.errors.full_messages.to_sentence
    end
    
    redirect_to edit_expense_path(params[:id])
  end

  private

  def permit_params
    params.require(:expense).permit(:expensable_id, :expensable_type, :payment_type, :payment_menthod, :amount, :project_id, :project_task_id, :project_sub_task_id, :pst, :gst, image_attributes: {})
  end
end
