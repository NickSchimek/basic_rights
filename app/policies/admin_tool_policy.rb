class AdminToolPolicy < Struct.new(:user, :AdminTool)
  def show?
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    user.superuser? || user.admin?
  end
end
