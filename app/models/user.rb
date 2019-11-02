class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :memberships, dependent: :destroy
  has_many :roles, through: :memberships
  # has one organization through memberships validations
  has_many :organizations, through: :memberships

  def superuser?
    roles.any? { |role| role.name == 'superuser' }
  end

  def admin?
    roles.any? { |role| role.name == 'admin' }
  end

  def admin_for?(record)
    admin? && organization == record.organization
  end

  def organization
    organizations.first
  end

  def role
    roles.first.name
  end
end
