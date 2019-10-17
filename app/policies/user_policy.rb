class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.superuser? || user.admin_for?(record)
  end

  def create?
    user.superuser? || user.admin?
  end
end
