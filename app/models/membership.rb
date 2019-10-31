class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :organization, required: false

  validates :organization, presence: true, unless: :superuser?
  validates :user, uniqueness: { scope: :role }
  validate :single_role

  private

    def superuser_role
      @superuser_role ||= Role.find_by(name: 'superuser')
    end

    def superuser?
      role_id == superuser_role.id
    end

    def single_role
      user = User.find_by(id: user_id)
      if user && user.memberships.any?
        errors.add(:user, "A role is already assigned")
      end
    end

end
