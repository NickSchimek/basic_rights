class AddOrganizationRefToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_reference :memberships, :organization, foreign_key: true
  end
end
