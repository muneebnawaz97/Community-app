class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from NameError, with: :route_not_found
  rescue_from ActionController::RoutingError, with: :route_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

  def route_not_found
    render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
  end

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

  private

  def user_not_authorized
    flash[:alert] = "Unauthorized Action"
    redirect_to(request.referer || root_path)
  end

  def record_not_found
    render file: Rails.public_path.join("404.html"), status: :internal_server_error
  end

  def unprocessable_entity_response invalid
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end
end
