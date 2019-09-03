class CreateClaims < ActiveRecord::Migration[6.0]
  def change
    create_table :claims do |t|
      t.integer :quantity
      t.boolean :picked_up, null: false, default: false
      t.boolean :active, null: false, default: true
      t.references :surplu, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
