class AddUniqueIndexToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_index :memberships, [:role_id, :user_id], unique: true
  end
end
