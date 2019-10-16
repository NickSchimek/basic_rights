class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :organization, required: false

  validates :organization, presence: true, unless: :superuser?

  def superuser?
    role_id == Role.find_by(name: 'superuser').id
  end
end
