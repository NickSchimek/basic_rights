class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :memberships, dependent: :destroy
  has_many :roles, through: :memberships

  def site_admin?
    admin = Role.find_by(name: 'admin')
    memberships.find_by(role: admin)
  end

end
