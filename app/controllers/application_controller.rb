class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Rescuable

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for _resource
    root_path
  end

  def after_sign_out_path_for _resource_or_scope
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
  end
end
