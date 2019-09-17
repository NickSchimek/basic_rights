class Fulfillment < ApplicationRecord
  belongs_to :organization
  belongs_to :need
end
