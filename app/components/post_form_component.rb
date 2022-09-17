# frozen_string_literal: true

class PostFormComponent < ViewComponent::Base
  def initialize group:, post:
    @group = group
    @post = post
  end

  attr_reader :post, :group
end
