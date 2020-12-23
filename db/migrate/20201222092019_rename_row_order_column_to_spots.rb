class RenameRowOrderColumnToSpots < ActiveRecord::Migration[6.0]
  def change
    rename_column :spots, :row_order, :position
  end
end
