class AdminToolPolicy < Struct.new(:user, :AdminTool)
  def show?
    user.site_admin?
  end
end
