class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :memberships, dependent: :destroy
  has_many :roles, through: :memberships
  has_one :organization, through: :memberships

  def superuser?
    superuser = Role.find_by(name: 'superuser')
    memberships.find_by(role: superuser)
  end

end
