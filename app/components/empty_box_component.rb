# frozen_string_literal: true

class EmptyBoxComponent < ViewComponent::Base
  def initialize(title:)
    byebug
    @title = title
  end

  def content
    @title
  end

end
