class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.superuser?
  end

  def show?
    true
  end

  def create?
    user.superuser? || user.admin?
  end

  def destroy?
    user.superuser? || user.admin_for?(record)
  end
end
