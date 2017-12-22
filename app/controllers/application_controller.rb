class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:layout_by_resource]
  before_action :select_all_project_categories
  
  def select_all_project_categories
    @project_cats = current_user.try(:project_categories) || []
  end  


  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || projects_path(project_cat: current_user.project_categories.first.try(:name))
  end

  
  def layout_by_resource
    if devise_controller?
        "devise"
    else
      "application"
    end
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :company_name, :email, :password) }
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :company_name, :email, :password, :current_password, image_attributes: {}) }
  end
end
