class Claim < ApplicationRecord
  belongs_to :organization
  belongs_to :surplu
end
