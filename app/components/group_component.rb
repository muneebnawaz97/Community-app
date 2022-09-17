# frozen_string_literal: true

class GroupComponent < ViewComponent::Base
  def initialize group:, user:
    @group = group
    @current_user = user
  end

  def title
    @group.title
  end

  def total_members
    @group.users.count
  end

  def total_posts
    @group.posts.count
  end

  def last_activity
    if @group.posts&.last&.created_at
      distance_of_time_in_words(@group.posts.last.created_at, Time.now)
    else
      distance_of_time_in_words(@group.created_at, Time.now)
    end
  end
end
