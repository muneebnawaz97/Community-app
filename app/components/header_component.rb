# frozen_string_literal: true

class HeaderComponent < ViewComponent::Base
  def initialize current_user:
    @current_user = current_user
  end

  def user
    @current_user
  end

  def avatar
    @current_user&.avatar&.key
  end

  def name
    @current_user&.name
  end
end
