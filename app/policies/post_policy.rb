class PostPolicy < ApplicationPolicy
  def create?
    member?
  end

  def destroy?
    admin? || post_owner?
  end

  def update?
    admin? || post_owner?
  end

  def show?
    member?
  end

  private

  def admin?
    user.admin record.group
  end

  def post_owner?
    user.post_owner record
  end

  def member?
    user.member? record.group
  end
end
