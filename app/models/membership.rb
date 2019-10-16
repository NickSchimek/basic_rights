class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :organization, required: false

  validates :organization, absence: true, if: :superuser?
  validates :organization, presence: true, unless: :superuser?
  validates :user, uniqueness: { scope: :role }

  def superuser?
    role_id == Role.find_by(name: 'superuser').id
  end
end
