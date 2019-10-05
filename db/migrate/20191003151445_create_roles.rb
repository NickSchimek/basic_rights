class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    add_index :roles, :name, unique: true
  end
end
