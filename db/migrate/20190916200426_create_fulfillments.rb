class CreateFulfillments < ActiveRecord::Migration[6.0]
  def change
    create_table :fulfillments do |t|
      t.integer :quantity
      t.boolean :received, null: false, default: false
      t.boolean :active, null: false, default: true
      t.references :need, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
