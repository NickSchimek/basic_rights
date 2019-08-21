class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.string :resource
      t.string :description
      t.integer :quantity
      t.boolean :active

      t.timestamps
    end
  end
end
