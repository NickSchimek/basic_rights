class AddOrganizationRefToSurplus < ActiveRecord::Migration[6.0]
  def change
    add_reference :surplus, :organization, null: false, foreign_key: true
  end
end
