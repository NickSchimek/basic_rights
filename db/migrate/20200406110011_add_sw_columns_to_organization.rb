class AddSwColumnsToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :location, :text
    add_column :organizations, :contact_method, :text
    add_column :organizations, :contact_start_time, :time
    add_column :organizations, :regular_capacity, :integer
    add_column :organizations, :overflow_capacity, :integer
    add_column :organizations, :current_overflow_capacity, :integer
    add_column :organizations, :eligibility, :text
    add_column :organizations, :update_notes, :text
    add_column :organizations, :after_hours_notes, :text
  end
end
