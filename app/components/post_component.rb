# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  def initialize post:, show:, user:
    @post = post
    @show = show
    @current_user = user
  end

  attr_reader :post, :current_user

  def group
    post.group
  end

  def post_owner
    current_user.post_owner post
  end

  def admin
    current_user.admin group
  end

  def can_edit
    admin || post_owner
  end

  def user
    @post.user
  end

  def title
    @post.title
  end

  def content
    @post.content
  end

  def avatar
    user.avatar.key
  end

  def last_activity
    if @post.comments&.last&.created_at
      distance_of_time_in_words(@post.comments.last.created_at, Time.now)
    else
      distance_of_time_in_words(@post.created_at, Time.now)
    end
  end
end
