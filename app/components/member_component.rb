# frozen_string_literal: true

class MemberComponent < ViewComponent::Base
  with_collection_parameter :member

  def initialize(member:, group:)
    @member = member
    @group = group
  end

  def user
    @member
  end

  def group
    @group
  end
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
