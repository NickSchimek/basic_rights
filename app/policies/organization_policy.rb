class OrganizationPolicy < ApplicationPolicy
  def create?
    site_admin?
  end

  def update?
    site_admin?
  end

  def destroy?
    site_admin?
  end

  private
    def site_admin?
      role = Role.find_by(name: 'admin')
      user.memberships.find_by(role: role)
    end
end
