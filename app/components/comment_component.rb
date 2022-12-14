# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  def initialize comment:, user:
    @comment = comment
    @current_user = user
  end

  def parent
    comment.parent_id
  end

  attr_reader :comment, :current_user

  def comment_owner
    current_user.comment_owner comment
  end

  def admin
    current_user.admin group
  end

  def can_edit
    admin || comment_owner
  end

  def post
    comment.post
  end

  def group
    post.group
  end

  def user
    @comment.user
  end

  def content
    @comment.content
  end

  def avatar
    user.avatar.key
  end

  def last_activity
    distance_of_time_in_words(@comment.created_at, Time.now)
  end
end
