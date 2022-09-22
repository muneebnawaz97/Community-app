module Rescuable
  extend ActiveSupport::Concern

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from NameError, with: :route_not_found
    rescue_from ActionController::RoutingError, with: :route_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

    def route_not_found
      render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end

    def user_not_authorized
      flash[:alert] = 'Unauthorized Action'
      redirect_to(request.referer || root_path)
    end

    def record_not_found
      render file: Rails.public_path.join('404.html'), status: :internal_server_error
    end

    def unprocessable_entity_response invalid
      render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
  end
end
