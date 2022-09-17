# frozen_string_literal: true

class MemberComponent < ViewComponent::Base
  with_collection_parameter :member

  def initialize member:, group:, user:
    @member = member
    @group = group
    @user = user
  end

  def current_user
    @user
  end

  def can_remove
    admin && record_not_current_user
  end

  def admin
    current_user.admin group
  end

  def record_not_current_user
    current_user.id != member_id
  end

  def user
    @member
  end

  attr_reader :group

  def name
    @member.name
  end

  def member_id
    @member.id
  end

  def group_id
    @group.id
  end

  def avatar
    @member.avatar.key
  end
end
