class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.string :resource
      t.string :description
      t.integer :quantity
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
