class Surplu < ApplicationRecord
  validates :resource, presence: true
  belongs_to :organization
  has_many :claims, dependent: :destroy
end
