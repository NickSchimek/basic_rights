class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :organization, required: false

  validates :organization, absence: true, if: :superuser?
  validates :organization, presence: true, unless: :superuser?
  validates :user, uniqueness: { scope: :role }
  validate :single_role, unless: :superuser?

  private

    def superuser_role
      @superuser_role ||= Role.find_by(name: 'superuser')
    end

    def superuser?
      role_id == superuser_role.id
    end

    def single_role
      user = User.find(user_id)
      if user.roles.any? { |role| role.name == 'admin' || role.name == 'member' }
        errors.add(:user, "can't be an admin and member")
      end
    end

end
