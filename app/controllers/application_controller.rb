class ApplicationController < ActionController::Base
	include SessionsHelper
	  before_action :configure_permitted_parameters, if: :devise_controller?

	  def after_sign_in_path_for(resource)
	  	current_user
	  end

	  def after_sign_up_path_for(resource)
	  	current_user
	  end

  protected
  def configure_permitted_parameters
    attributes = [:name, :email, :password, :password_confirmation, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
