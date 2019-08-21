class CreateSurpluses < ActiveRecord::Migration[6.0]
  def change
    create_table :surpluses do |t|
      t.string :resource
      t.string :description
      t.integer :quantity
      t.boolean :active

      t.timestamps
    end
  end
end
