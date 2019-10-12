class OrganizationPolicy < ApplicationPolicy
  def create?
    user.superuser?
  end

  def update?
    user.superuser?
  end

  def destroy?
    user.superuser?
  end

end
