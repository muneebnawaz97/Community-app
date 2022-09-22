class GroupTypePolicy < ApplicationPolicy

  def index?
    user
  end

  def show?
    user
  end
end