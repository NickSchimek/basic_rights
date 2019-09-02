class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :needs, dependent: :destroy
  has_many :surplus, dependent: :destroy
end
