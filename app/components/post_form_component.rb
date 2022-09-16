# frozen_string_literal: true

class PostFormComponent < ViewComponent::Base

  def initialize(group:, post:)
    @group = group
    @post = post
  end

  def post
    @post
  end

  def group
    @group
  end

end
