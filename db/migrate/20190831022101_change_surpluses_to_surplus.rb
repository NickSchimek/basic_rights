class ChangeSurplusesToSurplus < ActiveRecord::Migration[6.0]
  def change
    rename_table :surpluses, :surplus
  end
end
