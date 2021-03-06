class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :needs, dependent: :destroy
  has_many :surplus, dependent: :destroy
  has_many :claims
  has_many :fulfillments
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
