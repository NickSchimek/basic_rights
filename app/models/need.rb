class Need < ApplicationRecord

  validates :resource, presence: true
  belongs_to :organization
end
