class GroupPolicy < ApplicationPolicy
  def update?
    admin?
  end

  def create?
    user
  end

  def show?
    group_member?
  end

  private

  def admin?
    user.admin record
  end

  def group_member?
    user.member? record
  end
end
