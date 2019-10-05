class OrganizationPolicy < ApplicationPolicy
  def create?
    user.site_admin?
  end

  def update?
    user.site_admin?
  end

  def destroy?
    user.site_admin?
  end

end
