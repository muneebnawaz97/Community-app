# frozen_string_literal: true

class CommentFormComponent < ViewComponent::Base
  def initialize group:, post:, comment:
    @group = group
    @post = post
    @comment = comment
  end

  def parent
    comment.parent_id
  end

  attr_reader :edit, :group, :post, :comment
end
