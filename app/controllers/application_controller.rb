class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :user_before_action?

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
   end

  def after_sign_in_path_for(resource)
	  user_path(resource)
  end

  def after_sign_out_path_for(resource)
	  root_path
  end

  private
  def user_before_action?
  	true
  end
end
