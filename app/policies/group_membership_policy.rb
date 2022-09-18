class GroupMembershipPolicy < ApplicationPolicy
  def destroy?
    admin?
  end

  def create?
    user
  end

  private

  def admin?
    user.admin record.group
  end
end
