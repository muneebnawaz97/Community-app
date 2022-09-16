# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  def initialize(comment:, user:)
    @comment = comment
    @current_user = user
  end

  def comment
    @comment
  end

  def post
    comment.post
  end

  def group
    post.group
  end

  def current_user
    @current_user
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
