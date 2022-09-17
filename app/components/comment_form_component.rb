# frozen_string_literal: true

class CommentFormComponent < ViewComponent::Base
  def initialize(group:, post:, comment:)
    @group = group
    @post = post
    @comment = comment
  end
  
  def parent
    comment.parent_id
  end

  def edit
    @edit
  end

  def group
    @group
  end

  def post
    @post
  end

  def comment
    @comment
  end
end
