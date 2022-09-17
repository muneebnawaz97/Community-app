# frozen_string_literal: true

class ReplyCommentFormComponent < ViewComponent::Base
  def initialize post:, comment:
    @post = post
    @comment = comment
  end

  def parent
    new_comment.parent_id
  end

  def new_comment
    comment.replies.build
  end

  attr_reader :edit, :post, :comment

  def group
    post.group
  end
end
