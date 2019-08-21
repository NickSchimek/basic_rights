class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
