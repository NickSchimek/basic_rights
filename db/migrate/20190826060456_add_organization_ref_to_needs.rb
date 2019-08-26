class AddOrganizationRefToNeeds < ActiveRecord::Migration[6.0]
  def change
    add_reference :needs, :organization, null: false, foreign_key: true
  end
end
