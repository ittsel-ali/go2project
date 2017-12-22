class Users::RegistrationsController < Devise::RegistrationsController
  layout "application"

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
