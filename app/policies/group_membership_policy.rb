class GroupMembershipPolicy < ApplicationPolicy

  def destroy?
    user
  end

  def create?
    user
  end

  private

  def admin?
    user.admin record
  end
end