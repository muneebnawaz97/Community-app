class CommentPolicy < ApplicationPolicy
  def destroy?
    admin? || comment_owner?
  end

  def update?
    admin? || comment_owner?
  end

  private

  def admin?
    user.admin record.post.group
  end

  def comment_owner?
    user.comment_owner record
  end
end
