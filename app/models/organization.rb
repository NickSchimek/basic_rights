class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :needs, dependent: :destroy
end
