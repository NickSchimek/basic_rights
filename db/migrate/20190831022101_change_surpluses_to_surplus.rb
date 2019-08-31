class ChangeSurplusesToSurplus < ActiveRecord::Migration[6.0]
  def change
    rename_table :surplus, :surplus
  end
end
